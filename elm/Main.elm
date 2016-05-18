import Html.App

import Model
import View
import Update


main =
  Html.App.program
    { init = (Model.init, Update.init)
    , update = Update.update
    , subscriptions = Update.subscriptions
    , view = View.view
    }
