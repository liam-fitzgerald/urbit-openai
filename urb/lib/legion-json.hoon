/-  leg=legion
|%
++  enjs
  =,  enjs:format
  |%
  ++  lore
    |=  =lore:leg
    %-  pairs
    %+  turn  ~(tap by lore)
    |=  [id=@uv msgs=(list msg:leg) t=tale:leg]
    :-  (scot %uv id)
    %-  pairs
    :~  tale/(tale t)
        :-  %msgs
        :-  %a
        (turn msgs msg)
    ==
  ++  tale
    |=  t=tale:leg
    %-  pairs
    :~  title/s/title.t
        model/s/model.t
    ==
  ++  msgs
    |=  =msgs:leg
    %-  pairs
    %+  turn  (tap:on:msgs:leg msgs)
    |=  [id=@da p=msg:leg]
    [(scot %da id) (msg p)]
  ++  msg
    |=  p=msg:leg
    %-  pairs
    :~  tale/s/(scot %uv tale.p)
        parent/?~(parent.p ~ s/(scot %da u.parent.p))
        role/s/role.p
        text/s/text.p
    ==
  ++  gift
    |=  g=gift:leg
    %+  frond  -.g
    ?-  -.g
      %add  (pairs id/s/(scot %da id.g) msg/(msg msg.g) ~)
      %del  s/(scot %da id.g)
    ==
  --
++  dejs
  =,  dejs:format
  |%
  ++  command
    |=  jon=json
    ^-  command:leg
    ~|  jon/jon
    %.  jon
    %-  of
    :~  set-api-key/so
        msg/command-msg
        add-tale/add-tale
    ==
  ++  add-tale
    %-  ot
    :~  id/(se %uv)
        tale/tale
    ==
  ++  tale
    %-  ot
    :~  title/so
        model/so
    ==
  ::
  ++  command-msg
    %-  ot
    :~  id/(se %da)
        tale/(se %uv)
        parent/(mu (se %da))
        text/so
    ==
  --
--
