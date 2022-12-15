{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -Wno-orphans #-}

module Data.Cereal.Instances where

import Data.Cereal.TH
import Data.Aeson (Value(..))
import Data.Aeson.KeyMap (KeyMap)
import Data.Serialize (Serialize (put, get))
import qualified Data.Aeson.KeyMap as KeyMap
import qualified Data.Aeson as Aeson
import qualified Data.Aeson.Key as Key

instance Serialize Aeson.Key where
  put = put . Key.toText
  get = Key.fromText <$> get

instance Serialize a => Serialize (KeyMap a) where
  put = put . KeyMap.toMap
  get = KeyMap.fromMap <$> get

$(makeCereal ''Value)
