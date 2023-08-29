This document provides an overview of markdown syntax. Most of them are standard markdown elements, some of them only work in Obsidian and may require installing a plugin.

#### Text Style
normal 
~~strike through~~ 
*italic* 
**bold** 
***italic and bold***
==highlighted==
You can also use standard HTML to style text:
<font style="color:green">This is green text.</font>

#### Checkbox and Task Management
<<<<<<< HEAD
- [ ]2023-07-16 unchecked
- [x] checked
- [-] ~~cancelled~~
- [x] scheduled
	[ ]1. eat some vegetables
	[ ] 2. do some exercises
- [x] need more info
- [x] important
=======
- [ ] unchecked
- [x] checked ✅ 2023-07-15
- [ ] ~~cancelled~~
- [ ] scheduled world domination 2066-01-01 
	- [ ] eat some vegetables
	- [ ] do some exercises
- [ ] [?] need more info
- [ ] [!] important


>>>>>>> origin/main


#### Quote
quote block:
```
(define (eternity (eternity)))
...
```
inline quote `(lambda (x) (* x x))`  in a line 

#### Links and References
#tag You can #tag anywhere. You can use Obsidian's tag search to look for blocks that contain a tag.
This is an example of footnote.[^1] 
This is an internal [link]. Try to click on it.
This is an [external link](http://www.nowhere.com/)

#### List
- list 1
- list 2
1. numbered list 1
2. numbered list 2
	1. you can you tab to make nested list
	2. ...


[^1]: This is an example of footnote. Foot note lines need to start with `[^x]:` where x is the foot note index.
