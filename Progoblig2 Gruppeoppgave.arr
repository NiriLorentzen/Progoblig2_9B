use context essentials2021
include image

sirkel1 = circle(50, "solid", "orange")
sirkel2 = circle(40, "solid", "blue")  
sirkel3 = circle(30, "solid", "green") 
sirkel4 = circle(20, "solid", "red")   
pinne = circle(5, "solid", "black")    

sirkel1Just = rectangle(500, 200, "solid", "transparent")
sirkel2Just = rectangle(480, 200, "solid", "transparent")
sirkel3Just = rectangle(460, 200, "solid", "transparent")
sirkel4Just = rectangle(440, 200, "solid", "transparent")

spillFelt = rectangle(420, 200, "solid", "transparent")
feltSteg1 = overlay-align("left", "center", pinne, spillFelt)
feltSteg2 = overlay-align("center", "center", pinne, feltSteg1)
feltSteg3 = overlay-align("right", "center", pinne, feltSteg2)

justering = rectangle(540, 200, "solid" , "transparent")

Felt = overlay-align("center", "center", feltSteg3, justering)


var sirkel1_forje_pos = 1
var sirkel2_forje_pos = 1
var sirkel3_forje_pos = 1
var sirkel4_forje_pos = 1


var sirkel1_pos = 1
var sirkel2_pos = 1
var sirkel3_pos = 1
var sirkel4_pos = 1

var sist_flyttet_sirkel = 0

flytte_historikk = table: sirkel, historikk
  row: 1, [list: ]
  row: 2, [list: ]
  row: 3, [list: ]
  row: 4, [list: ]
end

fun new-game():
  block:
    sirkel1_pos := 1
    sirkel2_pos := 1
    sirkel3_pos := 1
    sirkel4_pos := 1
    tegn()
  end
end

fun regret_last_move():
  if sist_flyttet_sirkel == 1:
    if sirkel1_pos == sirkel1_forje_pos:
      "Kan ikke gå lengere tilbake"
    else:
      block:
        sirkel1_pos := sirkel1_forje_pos
        tegn()
      end
    end
  else if sist_flyttet_sirkel == 2:
    if sirkel2_pos == sirkel2_forje_pos:
      "Kan ikke gå lengere tilbake"
    else:
      block:
        sirkel2_pos := sirkel2_forje_pos
        tegn()
      end
    end
  else if sist_flyttet_sirkel == 3:
    if sirkel3_pos == sirkel3_forje_pos:
      "Kan ikke gå lengere tilbake"
    else:
      block:
        sirkel3_pos := sirkel3_forje_pos
        tegn()
      end
    end
  else if sist_flyttet_sirkel == 4:
    if sirkel4_pos == sirkel4_forje_pos:
      "Kan ikke gå lengere tilbake"
    else:
      block:
        sirkel4_pos := sirkel4_forje_pos
        tegn()
      end
    end
  end
end

fun move(sirkel, target):
  if sirkel == 1:
    if ((sirkel1_pos == sirkel2_pos) or (sirkel1_pos == sirkel3_pos) or (sirkel1_pos == sirkel4_pos)) or (sirkel1_pos == target) or (sirkel2_pos == target) or (sirkel3_pos == target) or (sirkel4_pos == target):
      "ugyldig trekk, prov igjen"
    else:
      block:
        sirkel1_forje_pos := sirkel1_pos
        sirkel1_pos := target
        sist_flyttet_sirkel := 1
        tegn()
      end
    end
  else if sirkel == 2:
    if ((sirkel2_pos == sirkel3_pos) or (sirkel2_pos == sirkel4_pos)) or (sirkel3_pos == target) or (sirkel4_pos == target) or (sirkel2_pos == target):
      "ugyldig trekk, prov igjen"
    else:
      block:
        sirkel2_forje_pos := sirkel2_pos
        sirkel2_pos := target
        sist_flyttet_sirkel := 2
        tegn()
      end
    end
  else if sirkel == 3:
    if (sirkel3_pos == sirkel4_pos) or (sirkel3_pos == target) or (sirkel4_pos == target):
      "ugyldig trekk, prov igjen"
    else:
      block:
        sirkel3_forje_pos := sirkel3_pos
        sirkel3_pos := target
        sist_flyttet_sirkel := 3
        tegn()
      end
    end
  else if (sirkel == 4) or (sirkel4_pos == target):
    block:
      sirkel4_forje_pos := sirkel4_pos
      sirkel4_pos := target
      sist_flyttet_sirkel := 4
      tegn()

    end
  end
end

fun tegn():
  underlay(sirkel1_fiks(sirkel1_pos),
    underlay(sirkel2_fiks(sirkel2_pos),
      underlay(sirkel3_fiks(sirkel3_pos),
        sirkel4_fiks(sirkel4_pos))))
end

fun sirkel1_fiks(pos):
  if pos == 1:
    block:
      venstre1 = underlay-align("left", "center", sirkel1, sirkel1Just)
      pos_fiks = underlay-align("center", "center", venstre1, Felt)
      pos_fiks
    end
  else if pos == 2:
    block: 
      midten1 = underlay-align("center", "center", sirkel1, sirkel1Just)
      pos_fiks = underlay-align("center", "center", midten1, Felt)
      pos_fiks
    end
  else if pos == 3:
    block:
      hoyre1 = underlay-align("right", "center", sirkel1, sirkel1Just)
      pos_fiks = underlay-align("center", "center", hoyre1, Felt)
      pos_fiks
    end
  else:
    "ugyldig verdi/svar"
  end
end

fun sirkel2_fiks(pos):
  if pos == 1:
    block:
      venstre2 = underlay-align("left", "center", sirkel2, sirkel2Just)
      pos_fiks = underlay-align("center", "center", venstre2, Felt)
      pos_fiks
    end
  else if pos == 2:
    block: 
      midten2 = underlay-align("center", "center", sirkel2, sirkel2Just)
      pos_fiks = underlay-align("center", "center", midten2, Felt)
      pos_fiks
    end
  else if pos == 3:
    block:
      hoyre2 = underlay-align("right", "center", sirkel2, sirkel2Just)
      pos_fiks = underlay-align("center", "center", hoyre2, Felt)
      pos_fiks
    end
  else:
    "ugyldig verdi/svar"
  end
end

fun sirkel3_fiks(pos):
  if pos == 1:
    block:
      venstre3 = underlay-align("left", "center", sirkel3, sirkel3Just)
      pos_fiks = underlay-align("center", "center", venstre3, Felt)
      pos_fiks
    end
  else if pos == 2:
    block: 
      midten3 = underlay-align("center", "center", sirkel3, sirkel3Just)
      pos_fiks = underlay-align("center", "center", midten3, Felt)
      pos_fiks
    end
  else if pos == 3:
    block:
      hoyre3 = underlay-align("right", "center", sirkel3, sirkel3Just)
      pos_fiks = underlay-align("center", "center", hoyre3, Felt)
      pos_fiks
    end
  else:
    "ugyldig verdi/svar"
  end
end

fun sirkel4_fiks(pos):
  if pos == 1:
    block:
      #left1 = underlay-align("left", "center", sirkel1, sirkel1Justering)
      #posFiks = underlay-align("center", "center", left1, ferdigFelt)
      #posFiks
      venstre4 = underlay-align("left", "center", sirkel4, sirkel4Just)
      pos_fiks = underlay-align("center", "center", venstre4, Felt)
      pos_fiks
    end
  else if pos == 2:
    block: 
      midten4 = underlay-align("center", "center", sirkel4, sirkel4Just)
      pos_fiks = underlay-align("center", "center", midten4, Felt)
      pos_fiks
    end
  else if pos == 3:
    block:
      hoyre4 = underlay-align("right", "center", sirkel4, sirkel4Just)
      pos_fiks = underlay-align("center", "center", hoyre4, Felt)
      pos_fiks
    end
  else:
    "ugyldig verdi/svar"
  end
end

fun start():
  block:
    print("Hanoi spill!")
    print("Flytt alle sirklene en og en av gangen ifra den venstre pinnen til den mest til høyre.")
    print("Man flytter sirklene ved å skrive 'move(sirkel, pinne)', pinnene er fra venstre til høyre (1, 2, 3), og sirklene er fra størst til minst(1, 2, 3, 4)")
    print("eksempel på flytting: move(4, 3)")
    print("Regler: Sirklene kan ikke være plassert på en mindre sirkel, man kan bare flytte en av gangen, man kan bare flytte den øverste")
    print("Lykke til!")
    print("Andre funksjoner: 'new-game()' for nytt spill, 'regret_last_move()' for å angre forje flytting (bare en gang tilbake)")
    tegn()
  end
end

#move(4, 1)

start()
