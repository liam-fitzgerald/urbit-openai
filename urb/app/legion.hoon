/-  spider, gpt
/+  default-agent, dbug, legion
|%
+$  card  card:agent:gall
+$  state-0
  $:  %0
      api-key=@t
      =prompts:legion
      heritage=(jug @da @da)
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
    %prompt       (on-prompt +.command) 
  ==
++  on-prompt
  |=  [id=@da parent=(unit @da) text=@t]
  =/  =prompt:legion  [parent %user text]
  =/  req=chat-completion:req:gpt
    :-  'gpt-3.5-turbo' 
    (snoc (ancestry-to-req:legion parent prompts) [%user text])
  =.  main  (save-prompt id prompt)
  =/  =tid:rand  (cat 3 'prompt-' (scot %da id))
  %+  start-thread  id
  :*  ~
      `tid
      byk.bowl
      %gpt-chat
      !>([~ req])
  ==
::
++  save-prompt
  |=  [id=@da =prompt:legion]
  =.  prompts
    (put:on:prompts:legion prompts id prompt)
  =?  heritage  ?=(^ parent.prompt)
    (~(put ju heritage) u.parent.prompt id)
  (emit %give %fact ~[/prompts] legion-gift+!>([%add id prompt]))
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
  !!
++  peek
  |=  =(pole knot)
  ^-  (unit (unit cage))
  ?+  pole  [~ ~]
    [%x %api-key ~]  ``noun+!>(api-key)
      [%x %ancestry id=@ ~]
    ``noun+!>((trace-ancestry:legion (slav %da id.pole) prompts))
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
    =/  =prompt:legion  [`parent %assistant result]
    ~&  >  [id parent result]
    (save-prompt id prompt)
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
