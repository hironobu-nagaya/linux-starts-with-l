#!/bin/awk -f
# Begin libexec/generate-html.awk

function prepare_emotions(emotion_str) {
  split("", emotions)
  split(emotion_str, emotion_lines, ";")
  for (i = 1; i <= length(emotion_lines); i++) {
    split(emotion_lines[i], emotion_fields, ",")
    emotions[emotion_fields[2]] = emotion_fields[1]
  }
}

function prepare_speakers(speaker_str) {
  split("", speakers)
  split(speaker_str, speaker_lines, ";")
  for (i = 1; i <= length(speaker_lines); i++) {
    split(speaker_lines[i], speaker_fields, ",")
    speakers[speaker_fields[3]] = speaker_fields[1] "," speaker_fields[2] "," speaker_fields[4]
  }
}

function draw_head(chapter, story, title, keywords, description, rel_prev, rel_next, stylesheet) {
  print "<head>"
  print "<title>Lから始まるLinux - " chapter "章" story "話 " sanitize(title) "</title>"
  print "<base href=\"../..\">"
  print "<meta charset=\"utf-8\">"
  print "<meta name=\"author\" content=\"Hironobu Nagaya\">"
  print "<meta name=\"robots\" content=\"all\">"
  print "<meta name=\"keywords\" content=\"" to_keywords_content(keywords) "\">"
  print "<meta name=\"description\" content=\"" sanitize(description) "\">"
  print "<meta name=\"viewport\" content=\"width=device-width, initial-scale=0.5\" />"
  print "<meta name=\"format-detection\" content=\"telephone=no, email=no, address=no\" />"
  if (length(rel_prev) > 0) {
    print "<link rel=\"prev\" href=\"" rel_prev "\" />"
  }
  if (length(rel_next) > 0) {
    print "<link rel=\"next\" href=\"" rel_next "\" />"
  }
  print "<link rel=\"icon\" href=\"favicon.svg\" type=\"image/svg+xml\">"
  for (i = 1; i <= length(stylesheets); i++) {
    print "<link rel=\"stylesheet\" href=\"css/" stylesheets[i] "\" type=\"text/css\">"
  }
  print "</head>"
}

function start_body(rel_prev, prev_chapter, prev_story, prev_title, chapter, story, title, rel_next, next_chapter, next_story, next_title) {
  print "<body>"
  print "<header>"
  print "<h1>Lから始まるLinux</h1>"
  draw_relation(rel_prev, prev_chapter, prev_story, prev_title, chapter, story, title, rel_next, next_chapter, next_story, next_title)
  print "</header>"
  print "<main>"
  print "<section>"
}

function draw_relation(rel_prev, prev_chapter, prev_story, prev_title, chapter, story, title, rel_next, next_chapter, next_story, next_title) {
  print "<div class=\"relation\">"
  print "<div>"
  if (length(rel_prev) > 0) {
    print "<div>前</div>"
    print "<div>" prev_chapter "章" prev_story  "話</div>"
    print "<div><a href=\"" rel_prev "\">" prev_title "</a></div>"
  }
  print "</div>"
  print "<div>"
  print "<div>今</div>"
  print "<div>" chapter "章" story "話 " title "</div>"
  print "<div><a href=\".\">もくじ</a></div>"
  print "</div>"

  print "<div>"
  if (length(rel_next) > 0) {
    print "<div>次</div>"
    print "<div>" next_chapter "章" next_story "話</div>"
    print "<div><a href=\"" rel_next "\">" next_title "</a></div>"
  }
  print "</div>"
  print "</div>"
}

function sanitize(string) {
  return gensub(/"/, "\\&quot;", "g", gensub(/>/, "\\&gt;", "g", gensub(/</, "\\&lt;", "g", gensub(/&/, "\\&amp;", "g", string))))
}

function replace_markdown(string) {
  while (string ~ /\[.*\]\(.*\)/) {
    string = gensub(/\[([^\]]*)\]\(([^\)]*)\)/, "</span><a href=\"\\2\" target=\"_blank\" rel=\"noopener noreferrer\">\\1</a><span>", 1, string)
  }
  while (string ~ /`.+`/) {
    string = gensub(/`([^`]+)`/, "</span><code>\\1</code><span>", 1, string)
  }
  while (string ~ /\*\*.+\*\*/) {
    string = gensub(/\*\*([^*]+)\*\*/, "</span><strong>\\1</strong><span>", 1, string)
  }
  return gensub(/<span><\/span>/, "", "g", "<span>" replace_span(gensub(/「/, "<wbr>「", "g", gensub(/([、。」]|[\/\.,] +)/, "\\1<wbr>", "g", gensub(/!pipe!/, "|", "g", gensub(/!backquote!/, "`", "g", string))))) "</span>")
}

function replace_code(string) {
  return replace_span(gensub(/!cursor!/, "<span class=\"cursor\">▌</span>", "g", gensub( /( +)/, "\\1<wbr>", "g", string)))
}

function replace_span(string) {
  return gensub(/!start-([^!-]*)-([^!]*)!/, "<span \\1=\"\\2\">", "g", gensub(/!end!/, "</span>", "g", string))
}

function to_keywords_content(keywords) {
  for (i = 1; i <= length(keywords); i++) {
    keywords_content = keywords_content keywords[i] (i == length(keywords) ? "" : ",")
  }
  return sanitize(keywords_content)
}

function draw_header(level, header) {
  print "<article class=\"header" level "\">" replace_markdown(sanitize(header)) "</article>"
}

function draw_image(line) {
  alt = gensub(/^.*\[([^\]]*)\].*$/, "\\1", 1, line)
  src = gensub(/^.*\(([^\)]*)\).*$/, "\\1", 1, line)
  print "<article class=\"image\"><img src=\"" src "\" alt=\"" alt "\"/></article>"
}

function draw_situation(situation) {
  print "<article class=\"situation\">" replace_markdown(sanitize(situation)) "</article>"
}

function draw_talk(speaker, emotion, content) {
  print "<article class=\"talk\">"
  print "<div><img src=\"img/" to_speaker_name(speaker) to_emotion_name(emotion) ".svg\" alt=\"" to_alt(speaker, emotion) "\" /></div>"
  print "<div>"

  for (i = 1; i <= length(content); i++) {
    print "<span>" replace_markdown(sanitize(content[i])) "</span>"
  }
  print "</div>"
  print "</article>"
}

function to_alt(speaker, emotion) {
  speaker_full_name = to_speaker_full_name(speaker)
  if (emotion == "通常") {
    return speaker_full_name
  }
  return speaker_full_name "(" emotion ")"
}

function to_speaker_name(speaker) {
  return length(speakers[speaker]) == 0 ? "unknown" : gensub(/,.*/, "", 1, speakers[speaker])
}

function to_speaker_full_name(speaker) {
  return length(speakers[speaker]) == 0 ? "不明" : gensub(/.*,/, "", 1, speakers[speaker])
}

function to_emotion_name(emotion) {
  return (length(emotions[emotion]) == 0 ? "" : "-") emotions[emotion]
}

function draw_unordered_list(content) {
  print "<article class=\"unordered-list\">"
  print "<ul>"
  for (i = 1; i <= length(content); i++) {
    print "<li>" replace_markdown(sanitize(content[i])) "</li>"
  }
  print "</ul>"
  print "</article>"
}

function draw_ordered_list(content) {
  print "<article class=\"ordered-list\">"
  print "<ol>"
  for (i = 1; i <= length(content); i++) {
    print "<li>" replace_markdown(sanitize(content[i])) "</li>"
  }
  print "</ol>"
  print "</article>"
}

function draw_code(content, code) {
  print "<article class=\"code\"><pre><code class=\"" code "\">" replace_code(sanitize(content[1]))
  for (i = 2; i <= length(content); i++) {
    print replace_code(sanitize(content[i]))
  }
  print "</code></pre></article>"
}

function dwaw_horizontalrule() {
  print "<hr />"
}

BEGIN {
  prepare_emotions(emotion_str)
  prepare_speakers(speaker_str)

  state = "head" # head, body, header1, header2, talk, unordered-list, ordered-list, table, code
  chapter = 0
  story = 0
  title = "無題"
  keywords[1] = "Lから始まるLinux"
  keywords[2] = "Linux starts with L"
  keywords[3] = "linux"
  description = "兄妹の対話を通してLinuxへの理解を深めていくお話です"
  stylesheets[1] = "normalize.css"
  stylesheets[2] = "common.css"
  stylesheets[3] = "story.css"
  javascripts[1] = "jquery.js"
  javascripts[2] = "common.js"

  speaker = "みどり"
  emotion = "通常"
  split("", content)

  print "<!DOCTYPE html>"
  print "<html lang=\"ja\">"
}

{
  if (/^#/) {
    switch(state) {
      case "head":
        draw_head(chapter, story, title, keywords, description, stylesheets)
        start_body(rel_prev, prev_chapter, prev_story, prev_title, chapter, story, title, rel_next, next_chapter, next_story, next_title)
        state = "body"
      case "body":
        draw_header((/^##/ ? 2 : 1), gensub(/^#+ (.*)$/, "\\1", 1, $0))
        break
      case "code":
        content[length(content) + 1] = $0
        break
    }
  } else if (/^----+$/) {
    switch (state) {
      case "body":
        dwaw_horizontalrule()
        break
      case "code":
        content[length(content) + 1] = $0
        break
    }
  }else if (/^\* /) {
    switch (state) {
      case "body":
        split("", content)
        state = "unordered-list"
      case "unordered-list":
        content[length(content) + 1] = gensub(/^\* +(.*) *$/, "\\1", 1, $0)
        break
      case "code":
        content[length(content) + 1] = $0
        break
    }
  } else if (/^[1-9][0-9]*\. /) {
    switch(state) {
      case "body":
        split("", content)
        state = "ordered-list"
      case "ordered-list":
        content[length(content) + 1] = gensub(/^[1-9][0-9]*\. +(.*) *$/, "\\1", 1, $0)
        break
      case "code":
        content[length(content) + 1] = $0
        break
    }
  } else if (/^```/) {
    switch(state) {
      case "code":
        draw_code(content, code)
        state = "body"
        break
      case "head":
        draw_head(chapter, story, title, keywords, description, rel_prev, rel_next, stylesheets)
        start_body(rel_prev, prev_chapter, prev_story, prev_title, chapter, story, title, rel_next, next_chapter, next_story, next_title)
      case "body":
        state = "code"
        code = gensub(/^```(.*)$/, "\\1", 1, $0)
        split("", content)
        break
      case "unordered-list":
        draw_unordered_list(content)
        state = "code"
        split("", content)
        break
      case "ordered-list":
        draw_ordered_list(content)
        state = "code"
        split("", content)
        break
    }
  } else if (/^[^ ]+[:：] *$/) {
    switch(state) {
      case "head":
        draw_head(chapter, story, title, keywords, description, rel_prev, rel_next, stylesheets)
        start_body(rel_prev, prev_chapter, prev_story, prev_title, chapter, story, title, rel_next, next_chapter, next_story, next_title)
      case "body":
        state = "talk"
        if (/^.*[（\)].*[）\)][：:]/) {
          speaker = gensub(/^([^（\(：:]*)[（\(：:].*$/, "\\1", 1, $0)
          emotion = gensub(/^[^（\(]*[（\(]([^）\)：:]*)[）\)：:].*$/, "\\1", 1, $0)
        } else {
          speaker = gensub(/^(.*)[：:][^：:]*$/, "\\1", 1, $0)
          emotion = "通常"
        }
        split("", content)
        break
      case "talk":
        draw_talk(speaker, emotion, content)
        if (/^.*[（\)].*[）\)][：:]/) {
          speaker = gensub(/^([^（\(：:]*)[（\(：:].*$/, "\\1", 1, $0)
          emotion = gensub(/^[^（\(]*[（\(]([^）\)：:]*)[）\)：:].*$/, "\\1", 1, $0)
        } else {
          speaker = gensub(/^(.*)[：:][^：:]*$/, "\\1", 1, $0)
          emotion = "通常"
        }
        split("", content)
        break
      case "unordered-list":
        draw_unordered_list(content)
        state = "body"
        break
      case "ordered-list":
        draw_ordered_list(content)
        state = "body"
        break
      case "code":
        content[length(content) + 1] = $0
        break
    }
  } else if (/^  /) {
    switch(state) {
      case "head":
        draw_head(chapter, story, title, keywords, description, rel_prev, rel_next, stylesheets)
        start_body(rel_prev, prev_chapter, prev_story, prev_title, chapter, story, title, rel_next, next_chapter, next_story, next_title)
        state = "body"
        break
      case "talk":
        content[length(content) + 1] = gensub(/^ *(.*) */, "\\1", 1, $0)
        break
      case "unordered-list":
        draw_unordered_list(content)
        state = "body"
        break
      case "ordered-list":
        draw_ordered_list(content)
        state = "body"
        break
      case "code":
        content[length(content) + 1] = $0
        break
    }
  } else if (/ \| /) {
    switch(state) {
      case "head":
        draw_head(chapter, story, title, keywords, description, rel_prev, rel_next, stylesheets)
        start_body(rel_prev, prev_chapter, prev_story, prev_title, chapter, story, title, rel_next, next_chapter, next_story, next_title)
        state = "body"
        break
      case "body":
        print "<article class=\"table\">"
        print "<table>"
        print "<thead>"
        print "<tr>"
        split($0, th, / *\| */)
        for (i = 1; i <= length(th); i++) {
          print "<th>" replace_markdown(sanitize(th[i])) "</th>"
        }
        print "</tr>"
        print "</thead>"
        print "<tbody>"
        state = "table"
        table_lines = 1
        break
      case "unordered-list":
        draw_unordered_list(content)
        state = "body"
        break
      case "ordered-list":
        draw_ordered_list(content)
        state = "body"
        break
      case "table":
        table_lines++
        if (table_lines == 2) {
          break
        }
        print "<tr>"
        split($0, td, / *\| */)
        for (i = 1; i <= length(td); i++) {
          print "<td>" replace_markdown(sanitize(td[i])) "</td>"
        }
        print "</tr>"
        break
      case "code":
        content[length(content) + 1] = $0
        break
    }
  } else if (/^ *$/) {
    switch(state) {
      case "head":
        draw_head(chapter, story, title, keywords, description, rel_prev, rel_next, stylesheets)
        start_body(rel_prev, prev_chapter, prev_story, prev_title, chapter, story, title, rel_next, next_chapter, next_story, next_title)
        state = "body"
        break
      case "talk":
        draw_talk(speaker, emotion, content)
        state = "body"
        break
      case "code":
        content[length(content) + 1] = $0
        break
      case "unordered-list":
        draw_unordered_list(content)
        state = "body"
        break
      case "ordered-list":
        draw_ordered_list(content)
        state = "body"
        break
      case "table":
        print "</tbody>"
        print "</table>"
        print "</article>"
        state = "body"
        break
    }
  } else {
    switch(state) {
      case "head":
        key = gensub(/^([^=]*)=.*$/, "\\1", 1, $0)
        value = gensub(/^[^=]*=(.*)$/, "\\1", 1, $0)
        switch(key) {
          case "chapter":
            chapter = value
            break
          case "story":
            story = value
            break
          case "title":
            title = value
            break
          case "keyword":
            keywords[length(keywords) + 1] = value
            break
          case "description":
            description = value
            break
          case "prev":
            rel_prev = value
            prev_chapter = gensub(/\/.*/,  "", 1, rel_prev)
            prev_story = gensub(/^[^\/]+\/([^\/]+)\/.*/, "\\1", 1, rel_prev)
            break
          case "prev-title":
            prev_title = value
            break
          case "next":
            rel_next = value
            next_chapter = gensub(/\/.*/,  "", 1, rel_next)
            next_story = gensub(/^[^\/]+\/([^\/]+)\/.*/, "\\1", 1, rel_next)
            break
          case "next-title":
            next_title = value
            break
          case "stylesheets":
            stylesheets[length(stylesheets) + 1] = value
            break
          case "javascripts":
            javascripts[length(javascripts) + 1] = value
            break
        }
        break
      case "code":
        content[length(content) + 1] = $0
        break
      case "body":
        if (/\[[^\]]+]\([^\)]+\.(png|jpg)\)/) {
          draw_image(gensub(/^ *(.*) *$/, "\\1", 1, $0))
        } else {
          draw_situation(gensub(/^ *(.*) *$/, "\\1", 1, $0))
        }
    }
  }
}

END {
  switch(state) {
    case "talk":
      draw_talk(speaker, emotion, content)
      break
    case "unordered-list":
      draw_unordered_list(content)
      break
    case "ordered-list":
      draw_ordered_list(content)
      break
    case "table":
      print "</tbody>"
      print "</table>"
      print "</article>"
      break
    case "code":
      draw_code(content)
      break
  }
  print "</section>"
  print "</main>"
  print "<footer>"
  draw_relation(rel_prev, prev_chapter, prev_story, prev_title, chapter, story, title, rel_next, next_chapter, next_story, next_title)
  print "</footer>"
  for (i = 1; i <= length(javascripts); i++) {
    print "<script src=\"js/" javascripts[i] "\"></script>"
  }
  print "</body>"
  print "</html>"
}

# End libexec/generate-html.awk
