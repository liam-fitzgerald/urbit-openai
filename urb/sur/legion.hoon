/-  gpt
|%
+$  command
  $%  [%set-api-key api-key=@t]
      [%prompt id=@da =prompt]
  ==
+$  prompt
  [parent=(unit @da) =role text=@t]
++  prompts
  =<  prompts
  |%
  +$  prompts
    ((mop @da prompt) lte)
  +$  on
    ((ordered-map @da prompt) lte)
  --
--
