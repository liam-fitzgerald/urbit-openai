/-  spider, gpt
/+  strandio
=,  strand=strand:spider
|%
++  encode-header
  |=  =conf:gpt
  ^-  header-list:http
  :~  [key='Authorization' value=(cat 3 'Bearer ' api-key:conf)]
      [key='Content-Type' value='application/json']
  ==
++  url  'https://api.openai.com/v1/chat/completions'
++  send-chat
  |=  [=conf:gpt req=chat-completion:req:gpt]
  =/  m  (strand ,chat-completion:res:gpt)
  =/  body=octs
    %-  as-octt:mimes:html
    %-  en-json:html
    (enjs-chat-completion:req:gpt req)
  =/  =request:http
    [%'POST' url (encode-header conf) `body]
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
=+  !<([~ req=chat-completion:req:gpt] vase)
;<  api-key=@t  bind:m
  (scry:strandio ,@t /gx/legion/api-key/noun)
=/  =conf:gpt  [api-key ~]
;<  res=chat-completion:res:gpt  bind:m  
  (send-chat conf req)
=/  response=@t
  content:message:(snag 0 choices.res)
(pure:m !>(response))

