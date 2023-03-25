/-  spider, gpt
/+  strandio
=,  strand=strand:spider
|%
++  conf
  ^~  ^-  conf:gpt
  ['sk-secret-key-goes-here' ~]
++  encode-header
  ^-  header-list:http
  :~  [key='Authorization' value=(cat 3 'Bearer ' api-key:conf)]
      [key='Content-Type' value='application/json']
  ==
++  url  'https://api.openai.com/v1/chat/completions'
++  send-chat
  |=  mess=@t
  =/  m  (strand ,chat-completion:res:gpt)
  =/  body=octs
    %-  as-octt:mimes:html
    =-  ~&(- -)
    %-  en-json:html
    %-  enjs-chat-completion:req:gpt
    :-  'gpt-3.5-turbo'
    [%user mess]~
  =/  =request:http
    [%'POST' url encode-header `body]
  ~&  request/request
  ;<  ~  bind:m  (send-request:strandio request)
  ;<  res=client-response:iris  bind:m
    take-client-response:strandio
  ;<  =cord  bind:m  
    (extract-body:strandio res)
  =/  jon=(unit json)  (de-json:html cord)
  ?~  jon  ~|  %wheres-my-lasagna-jon  !!
  (pure:m (dejs:chat-completion:res:gpt u.jon))
--
^-  thread:spider
|=  =vase
=/  m  (strand ^vase)
^-  form:m
=+  !<([~ question=@t] vase)
;<  res=chat-completion:res:gpt  bind:m  (send-chat question)
=/  response=@t
  content:message:(snag 0 choices.res)
(pure:m !>(response))

