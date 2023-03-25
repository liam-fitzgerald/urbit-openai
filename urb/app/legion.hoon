/-  legion
/+  
/+  default-agent
|%
+$  card  card:agent:gall
+$  state-0
  $:  %0
      api-key=@t
      =prompts:legion
      pending=(map @da tid:rand)
  ==
in0
=|  state-0
=*  state  -
=>
|_  [=bowl:gall cards=(list card)]
++  abet  [cards state]
++  main  .
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
  |=  [id=@da parent=(unit @da) prompt=@t]
  =.  prompts
    (put:on:prompts:legion prompts id prompt)
  (

++  on-watch
  |=  =path
  ^+  main
  !!
++  peek
  |=  =(pole knot)
  ^-  (unit (unit cage))
  ?+  pole  [~ ~]
    [%x %api-key ~]  ``noun+!>(api-key)
  ==
++  on-arvo
  |=  [=wire sign=sign-arvo]
  ^+  main
  !!
++  start-thread
  |=  
  
--
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
++  on-agent  on-agent:def
++  on-arvo
  |=  [=wire sign=sign-arvo]
  ^-  (quip card _this)
  =^  cards  state
    abet:(on-arvo:main wire sign)
  [cards this]
++  on-leave  on-leave:def
++  on-fail   on-fail:def
--
