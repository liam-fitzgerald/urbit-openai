/-  sur=legion
/-  gpt
=<  [sur .]
=,  sur
|%
++  ancestry-to-req
  |=  [id=(unit @da) =prompts]
  ^-  (list chat-mess:gpt)
  ?~  id
    ~
  =/  filtered  (tap:on:^prompts (trace-ancestry u.id prompts))
  ~&  filtered
  %+  turn  filtered
  |=  [@da =prompt]
  [role.prompt text.prompt]
::
++  trace-ancestry
  =|  res=prompts
  |=  [id=@da =prompts]
  ^+  res
  ?~  pro=(get:on:^prompts prompts id)
    res
  =.  res  (put:on:^prompts res id u.pro)
  ?~  parent.u.pro
    res
  $(id u.parent.u.pro)
--
  
