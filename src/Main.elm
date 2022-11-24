module Main exposing (main)

import Browser
import Css exposing (..)
import Html exposing (Html, h1, h2, h3, button, div, text, img)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Html exposing (Attribute)


-- MAIN 

main =
    Browser.sandbox { init = init, update = update, view = view }


-- MODEL

type alias Item = 
    { id   : Int
    , name : String
    , path : String
    }

areIdentical : Item -> Item -> Bool
areIdentical first second =
    first.id == second.id

type alias Sphere =
    { number : Int
    , items  : List Item
    }

type alias Model = 
    { items   : List Item
    , spheres : List Sphere
    } 

init : Model
init = {
       items = [
          { id = 0 , name = "scale",     path = "scale.png" }
        , { id = 1 , name = "slingshot", path = "slingshot.png" }
        , { id = 2 , name = "bombag",    path = "bombag.png" }
        , { id = 3 , name = "boomerang", path = "boomerang.png" }
        , { id = 4 , name = "str1",      path = "str1.png" }
        , { id = 5 , name = "str2",      path = "str2.png" }
        , { id = 6 , name = "str3",      path = "str3.png" }
        , { id = 7 , name = "magic",     path = "magic.png" }
        , { id = 8 , name = "dins",      path = "dins.png" }
        , { id = 9 , name = "hook",      path = "hook.png" }
        , { id = 10, name = "hook",      path = "hook.png" }
        , { id = 11, name = "bow",       path = "bow.png" }
        , { id = 12, name = "fa",        path = "fa.png" }
        , { id = 13, name = "ia",        path = "ia.png" }
        , { id = 14, name = "la",        path = "la.png" }
        , { id = 15, name = "hammer",    path = "hammer.png" }
        , { id = 16, name = "ib",        path = "iron.png" }
        , { id = 17, name = "hover",     path = "hover.png" }
        , { id = 18, name = "mirror",    path = "mirror.png" }
        , { id = 19, name = "egg",       path = "egg.png" }
        , { id = 20, name = "ocarina",   path = "ocarina.png" }
        , { id = 21, name = "beans",     path = "beans.png" }
        , { id = 22, name = "ksword",    path = "ksword.png" }
        , { id = 23, name = "gcard",     path = "gcard.png" }
        , { id = 24, name = "r-shirt",   path = "rshirt.png" }
        , { id = 25, name = "b-shirt",   path = "bshirt.png" }
        , { id = 26, name = "zelda",     path = "zelda.png" }
        , { id = 27, name = "epona",     path = "epona.png" }
        ]
    ,   spheres = [ {number = 0, items = [] } ]
    }

-- UPDATE

type Msg = Pick | Unpick

update : Msg -> Model -> Model
update action model = 
    model

-- VIEW

titleStyle : List (Attribute msg)
titleStyle =
    [ style "color" "ff461f" ]

renderSphere : Sphere -> Html Msg
renderSphere sphere =
    div []
    [ h3  [] [ text ("Sphere " ++ (String.fromInt sphere.number)) ]
    , div [] (List.map (renderItem) sphere.items )
    ]
    

renderItem : Item -> Html Msg
renderItem item =
    div [ style "flex-grow" "1"
        , style "flex-basis" "25%"
        ] 
        [ text( item.name ) ]


view : Model -> Html Msg
view model =
    div [] 
    [   h1  [ 
            style "color" "#ff461f"
        ] 
        [ text "Ocarina of time Sphere Tracker" ]
    ,   div [style "display" "block", style "width" "100%"] [
           div [] 
            [ h2 [] [text "Item list"]
            , div [ style "display" "flex"
                  , style "flex-flow" "row wrap"
                  ] (List.map renderItem model.items)
            ]
        ,  div [ style "display" "inline-block"]
            (List.map (renderSphere) model.spheres)
        ]
    ]
    