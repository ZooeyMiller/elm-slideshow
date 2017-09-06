port module Main exposing (..)

import Html exposing (..)
import Html.Attributes as Ha exposing (..)
import Html.Events as He exposing (..)
import Navigation


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = always Sub.none
        }


type alias Model =
    { slideshows : List Slideshow
    , location : String
    }


type alias Slideshow =
    List Slide


type alias Slide =
    { title : String
    , images : List String
    , text : List String
    , bgColour : String
    }


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( Model [] location.pathname, Cmd.none )


type Msg
    = UrlChange Navigation.Location
    | Route String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange newLocation ->
            ( { model | location = newLocation.hash }, Cmd.none )

        Route location ->
            ( model, Navigation.newUrl location )


view : Model -> Html Msg
view model =
    case model.location of
        "/" ->
            div [] [ text "hello world" ]

        "#/other" ->
            div [] [ text "other" ]

        _ ->
            div [] [ text "404" ]
