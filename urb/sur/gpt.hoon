|%
+$  conf
  [api-key=@t org=(unit cord)]
::
++  chat-mess
  =<  chat-mess
  |%
  +$  chat-mess
    $:  role=?(%system %user %assistant)
        content=@t
    ==
  ++  enjs
    |=  c=chat-mess
    ^-  json
    =,  enjs:format
    %-  pairs
    :~  role/s/role.c
        content/s/content.c
    ==
  ::
  ++  dejs
    =,  dejs:format
    %-  ot
    :~  role/(su (perk %system %user %assistant ~))
        content/so
    ==
  --
++  req
  |%
  ++  enjs-chat-completion
    |=  c=chat-completion
    ^-  json
    %-  pairs:enjs:format
    :~  model/s/model.c
        messages/a/(turn messages.c enjs:chat-mess)
    ==
  ::
  +$  chat-completion
    $:  model=@t  :: like 'gpt-3.5-turbo'
        messages=(list chat-mess)
    ==
  --
++  res
  |%
  ++  chat-completion
    =<  chat-completion
    |%
    +$  chat-completion
      $:  id=@t
          object=@t
          created=@da
          choices=(list chat-choice)
          =usage
      ==
    ++  dejs
      =,  dejs:format
      ^-  $-(json chat-completion)
      %-  ot
      :~  id/so
          object/so
          created/du
          =-  choices/(ar -)
          ^-  $-(json chat-choice)
          %-  ot
          :~  index/ni
              message/dejs:chat-mess
          ==
          =-  usage/-
          %-  ot
          :~  'prompt_tokens'^ni
              'completion_tokens'^ni
              'total_tokens'^ni
          ==
      ==
  --
  +$  chat-choice
    $:  index=@ud
        message=chat-mess
    ==
  +$  usage
    $:  prompt-tokens=@ud
        completion-tokens=@ud
        total-tokens=@ud
    ==
  --
--
