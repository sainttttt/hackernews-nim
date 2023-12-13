import std/[strformat, httpclient]
import gemmaJSON
import puppy
import print

proc entry(id: int): string =
  let storyAPI = &"https://hacker-news.firebaseio.com/v0/item/{id}.json?print=pretty"
  var res = ""
  try:
    res = fetch(storyAPI)
  finally:
    return res

var entryJson = parseGemmaJSON(entry(38415252))
for k in entryJson["kids"]:
  print entry(k.getInt)
  discard readLine(stdin)

