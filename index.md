---
theme: gaia
_class: lead
---

# The Elm Architecture

28.01.2020, Hanover

Alexander Foremny ([@aforemny](https://github.com/aforemny))

---

# Agenda

1. Motivation
1. The Elm Architecture
1. Outlook: Single Page Application
1. Hannover Elm Language Meetup
1. Resources

Questions are always welcome!

---

# Motivation

- Why learn another programming language?
- Why learn Elm?
- Why learn another language rather than another library?

> **Elm is a functional language that compiles to JavaScript**. It helps you make websites and web apps. It has a strong emphasis on simplicity […].

---

## Why learn another programming language?

You do not only learn another programming language for working with it. You might also learn another programming language to familiarize yourself with new ideas that might transfer to the language you are working with.

---

## Why learn Elm?

We are trying to form a local community, this is a great opportunity to learn a new language. In its category of languages, Elm is very suitable for beginners.

---

## Why learn another language rather than another library?

Elm as a *language* has specific benefits. In particular:

- No runtime exceptions in practice
- Friendly error messages
- Reliable refactoring
- Automatic enforced semantic versioning for all Elm packages

---

# The Elm Architecture

The Elm Architecture is a pattern for architecting interactive programs.

This architecture emerged naturally from working in a language like Elm, but its ideas are useful in any front-end project. In fact, you are likely to see similarities to other languages.

We will take a look at a simple example, and provide an outlook for a real-world application. We will explain syntax as we go.

---

## The Basic Pattern

- Model – the state of your application
- Update – a way to update your state based on messages
- View – a way to turn your state into HTML

---

## Example: Buttons

<iframe src="https://elm-lang.org/examples/_compiled/buttons.html" style="border: none; width: 61px; height: 73px; position: fixed; top: 50%; left: 50%; transform: translate3d(-50%,-50%,0) scale(3.5,3.5)"></iframe>

---

## Model

```elm
type alias Model = Int

init =
    0
```

---

## Update

```elm
type Msg = Increment | Decrement

update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1
```

---

## View

```elm
-- import Html exposing (button, div, text)
-- import Html.Events exposing (onClick)

view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (String.fromInt model) ]
        , button [ onClick Increment ] [ text "+" ]
        ]
```

---

## Boilerplate

```elm
import Browser
import Html.Events exposing (onClick)
import Html exposing (button, div, text)

main =
    Browser.sandbox { init = init, update = update, view = view }
```

---

## Some remarks

We did not use any **side-effects** in our program. In fact, it would not have been possible: Elm programs are *generally free of side-effects*.

We have not seen the **joy of writing such a program**. Many exciting features were not covered.

---

# Outlook: Single Page Application

For a real-world single page application, we find the following missing from the simple architecture:

- Performing side-effects
- Routing

How do we provide for that in the Elm architecture? We augment `Browser.sandbox` with the required functionality!

---

## Types

```elm
Browser.sandbox :
    { init : model
    , view : model -> Html msg
    , update : msg -> model -> model
    }
    -> Program () model msg
```

---

## Side-Effects

```elm
Browser.element :
    { init : flags -> ( model, Cmd msg )
    , view : model -> Html msg
    , update : msg -> model -> ( model, Cmd msg )
    , subscriptions : model -> Sub msg
    }
    -> Program flags model msg

-- Browser.sandbox :
--     { init : model
--     , view : model -> Html msg
--     , update : msg -> model -> model
--     }
--     -> Program () model msg
```

---

## Routing

```elm
Browser.application :
    { init : flags -> Url -> Key -> ( model, Cmd msg )
    , view : model -> Html msg
    , update : msg -> model -> ( model, Cmd msg )
    , subscriptions : model -> Sub msg
    , onUrlRequest : UrlRequest -> msg
    , onUrlChange : Url -> msg
    }
    -> Program flags model msg

-- Browser.element :
--     { init : flags -> ( model, Cmd msg )
--     , view : model -> Html msg
--     , update : msg -> model -> ( model, Cmd msg )
--     , subscriptions : model -> Sub msg
--     }
--     -> Program flags model msg
```

---

# Hannover Elm Language Meetup

We are organizing a monthly Elm meetup in Hafven, that has been going on for roughly six months and will continue to go on this year.

So far we have exercised learning the Elm programming language once and currently we are gathering informally to share what we are working on as well as to look at specific subjects.

We would be more than happy to provide guidance on learning the language, as well as experimenting with the meetup's program. Find us on [Meetup: Hannover Elm Language Meetup](https://meetup.com/Hannover-Elm-Language-Meetup).

---

## Questions

Thank you for your time!
**Do you have any questions?**

## Resources

- [Meetup: Hannover Elm Language Meetup](https://meetup.com/Hannover-Elm-Language-Meetup)
- [Elm website](https://elm-lang.org), [Elm Guide](https://guide.elm-lang.org)
- [These slides](https://github.com/aforemny/elm-tea-talk)
