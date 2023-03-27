/-  leg=legion
|%
++  enjs
  =,  enjs:format
  |%
  ++  prompts
    |=  =prompts:leg
    %-  pairs
    %+  turn  (tap:on:prompts:leg prompts)
    |=  [id=@da p=prompt:leg]
    [(scot %da id) (prompt p)]
  ++  prompt
    |=  p=prompt:leg
    %-  pairs
    :~  parent/?~(parent.p ~ s/(scot %da u.parent.p))
        role/s/role.p
        text/s/text.p
    ==
  ++  gift
    |=  g=gift:leg
    %+  frond  -.g
    ?-  -.g
      %add  (pairs id/s/(scot %da id.g) prompt/(prompt prompt.g) ~)
      %del  s/(scot %da id.g)
    ==
  --
++  dejs
  =,  dejs:format
  |%
  ++  command
    |=  c=command:leg
    %-  of
    :~  set-api-key/so
        prompt/command-prompt
    ==
  ++  command-prompt
    %-  ot
    :~  id/(se %da)
        parent/(mu (se %da))
        role/(su (perk %system %user %assistant ~))
        text/so
    ==
  --
--
