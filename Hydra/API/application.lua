--- application:visiblewindows() -> win[]
--- Returns only the app's windows that are visible.
function application:visiblewindows()
  return fnutils.filter(self:allwindows(), window.isvisible)
end

--- application.launchorfocus(name)
--- Launches the app with the given name, or activates it if it's already running.
function application.launchorfocus(name)
  os.execute("open -a \"" .. name .. "\"")
end

--- application:activate(allwindows = false) -> bool
--- Tries to activate the app (make its key window focused) and returns whether it succeeded; if allwindows is true, all windows of the application are brought forward as well.
function application:activate(allwindows)
  local win = self:_focusedwindow()
  if win then
    win:becomemain()
    self:_bringtofront(allwindows)
  else
    self:_activate(allwindows)
  end
end
