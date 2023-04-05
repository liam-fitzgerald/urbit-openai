/-  gpt
|%
+$  lore  (map @uv tome)
+$  book  [msgs=(list @da) tale]
+$  tome  [msgs=(list msg) tale]
+$  tale   
  $:  title=@t
      model=@t
  ==
+$  gift
  $%  [%add id=@da =msg]
      [%del id=@da]
  ==
+$  command
  $%  [%set-api-key api-key=@t]
      [%msg id=@da tale=@uv parent=(unit @da) text=@t]
      [%add-tale id=@uv =tale]
  ==
+$  msg
  [tale=@uv parent=(unit @da) =role:gpt text=@t]
++  msgs
  =<  msgs
  |%
  +$  msgs
    ((mop @da msg) lte)
  ++  on
    ((ordered-map @da msg) lte)
  --
--
