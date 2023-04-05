/-  sur=legion
/-  gpt
=<  [sur .]
=,  sur
|%
++  ancestry-to-req
  |=  [id=(unit @da) =msgs]
  ^-  (list chat-mess:gpt)
  ?~  id
    ~
  =/  filtered  (tap:on:^msgs (trace-ancestry u.id msgs))
  ~&  filtered
  %+  turn  filtered
  |=  [@da =msg]
  [role text]:msg
::
++  trace-ancestry
  =|  res=msgs
  |=  [id=@da =msgs]
  ^+  res
  ?~  pro=(get:on:^msgs msgs id)
    res
  =.  res  (put:on:^msgs res id u.pro)
  ?~  parent.u.pro
    res
  $(id u.parent.u.pro)
--
  
