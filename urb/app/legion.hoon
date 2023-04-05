/-  spider, gpt
/+  default-agent, dbug, legion
|%
+$  card  card:agent:gall
+$  state-0
  $:  %0
      api-key=@t
      =msgs:legion
      heritage=(jug @da @da)
      books=(map @uv book:legion)
  ==
--
=|  state-0
=*  state  -
=>
|_  [=bowl:gall cards=(list card)]
++  abet  [(flop cards) state]
++  main  .
++  emit  |=(=card main(cards [card cards]))
++  on-poke
  |=  [=mark =vase]
  ^+  main
  ?+  mark  !!
    %legion-command  (on-command !<(command:legion vase))
  ==
++  on-command
  |=  =command:legion
  ^+  main
  ::  TODO: maybe give notice?
  ?-  -.command
    %set-api-key  main(api-key api-key.command)
    %msg       (on-msg +.command) 
    %add-tale  (on-add-tale +.command)
  ==
++  on-add-tale
  |=  [id=@uv =tale:legion]
  ^+  main
  =.  books  (~(put by books) id [~ tale])
  main
++  on-msg
  |=  [id=@da tale=@uv parent=(unit @da) text=@t]
  =/  =msg:legion  [tale parent %user text]
  =/  req=chat-completion:req:gpt
    :-  'gpt-3.5-turbo' 
    (snoc (ancestry-to-req:legion parent msgs) [%user text])
  =.  main  (save-msg id msg)
  =/  =tid:rand  (cat 3 'msg-' (scot %da id))
  %+  start-thread  id
  :*  ~
      `tid
      byk.bowl
      %gpt-chat
      !>([~ req])
  ==
::
++  give
  |=  =gift:legion
  (emit %give %fact ~[/msg] legion-gift+!>(gift))
::
++  save-msg
  |=  [id=@da =msg:legion]
  =.  msgs
    (put:on:msgs:legion msgs id msg)
  =/  =book:legion  (~(got by books) tale.msg)
  =.  msgs.book  (snoc msgs.book id)
  =.  books
    (~(put by books) tale.msg book)
  =?  heritage  ?=(^ parent.msg)
    (~(put ju heritage) u.parent.msg id)
  (emit %give %fact ~[/msg] legion-gift+!>([%add id msg]))
::
++  start-thread
  |=  [id=@da =start-args:spider]
  ^+  main
  =/  =tid:rand  (need use.start-args)
  =/  =dock  [our.bowl %spider]
  =/  =cage  spider-start+!>(start-args)
  =/  =wire  /thread/(scot %da id)
  =.  main
    (emit %pass wire %agent dock %watch /thread-result/[tid])
  (emit %pass wire %agent dock %poke cage)
++  on-watch
  |=  =path
  ^+  main
  ?+  path  ~|(bad-watch/path !!)
    [%msg ~]  ?>(=(our src):bowl main)
  ==
++  lore
  ^-  lore:legion
  %-  ~(run by books)
  |=  [ids=(list @da) =tale:legion]
  :_  tale
  %+  turn  ids
  |=  id=@da
  (got:on:msgs:legion msgs id)
::
++  peek
  |=  =(pole knot)
  ^-  (unit (unit cage))
  ?+  pole  [~ ~]
    [%x %api-key ~]  ``noun+!>(api-key)
  ::
      [%x %ancestry id=@ ~]
    ``legion-msg+!>((trace-ancestry:legion (slav %da id.pole) msgs))
  ::
      [%x %lore ~]
    ``legion-lore+!>(lore)
  ==
::
++  on-agent
  |=  [=(pole knot) =sign:agent:gall]
  ?.  ?=([%thread id=@ *] pole)
    ~|  bad-agent-take/pole
    !!
  =/  parent=@da  (slav %da id.pole)
  ?-  -.sign
    %poke-ack   ~&  poke-ack/p.sign    main
    %watch-ack  ~&  watch-ack/p.sign   main
      %fact 
    ?.  =(%thread-done p.cage.sign)
      ?>  =(%thread-fail p.cage.sign)
      =+  !<([=term =tang] q.cage.sign)
      %-  (slog leaf/"gpt api call failed;" leaf/<term> tang)
      main
    =+  !<(result=@t q.cage.sign)
    =/  id=@da  now.bowl
    =/  par=msg:legion  (got:on:msgs:legion msgs parent)
    =/  =msg:legion  [tale.par `parent %assistant result]
    ~&  >  [id parent result]
    (save-msg id msg)
  ::
       %kick
    ~&  %kick
    main
  ==
::
++  on-arvo
  |=  [=wire sign=sign-arvo]
  ^+  main
  !!
--
%-  agent:dbug
|_  =bowl:gall
+*  this  .
    main  ~(. +> [bowl ~])
    def   ~(. (default-agent this %|) bowl)
++  on-init  `this
++  on-save  !>(state)
++  on-load
  |=  =vase
  =+  !<(old=state-0 vase)
  `this(state old)
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  =^  cards  state
    abet:(on-poke:main mark vase)
  [cards this]
++  on-watch
  |=  =path
  ^-  (quip card _this)
  =^  cards  state
    abet:(on-watch:main path)
  [cards this]
++  on-peek  peek:main
++  on-agent  
  |=  [=wire =sign:agent:gall]
  =^  cards  state
    abet:(on-agent:main wire sign)
  [cards this]
::
++  on-arvo
  |=  [=wire sign=sign-arvo]
  ^-  (quip card _this)
  =^  cards  state
    abet:(on-arvo:main wire sign)
  [cards this]
++  on-leave  on-leave:def
++  on-fail   on-fail:def
--
