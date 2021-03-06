module Paths_todo (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,3,0,1] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/matheushal/Documentos/PF/WEB/.cabal-sandbox/bin"
libdir     = "/home/matheushal/Documentos/PF/WEB/.cabal-sandbox/lib/x86_64-linux-ghc-7.10.3/todo-0.3.0.1-KByn2hbqJIwHs61NAq40t5"
datadir    = "/home/matheushal/Documentos/PF/WEB/.cabal-sandbox/share/x86_64-linux-ghc-7.10.3/todo-0.3.0.1"
libexecdir = "/home/matheushal/Documentos/PF/WEB/.cabal-sandbox/libexec"
sysconfdir = "/home/matheushal/Documentos/PF/WEB/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "todo_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "todo_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "todo_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "todo_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "todo_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
