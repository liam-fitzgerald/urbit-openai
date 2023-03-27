/-  gpt
|%
+$  gift
  $%  [%add id=@da =prompt]
      [%del id=@da]
  ==
+$  command
  $%  [%set-api-key api-key=@t]
      [%prompt id=@da parent=(unit @da) text=@t]
  ==
+$  prompt
  [parent=(unit @da) =role:gpt text=@t]
++  prompts
  =<  prompts
  |%
  +$  prompts
    ((mop @da prompt) lte)
  ++  on
    ((ordered-map @da prompt) lte)
  --
--
