pev = ->

  # trigger
  event = (args...) ->
    promise = new Promise (resolve) -> resolve args
    return Promise.all (subscriber promise for subscriber in event.subscribers)

  event.subscribers = []

  # @returns disposable
  event.add = (callback) ->
    event.subscribers.push(callback)
    -> event.del(callback)

  event.del = (callback) ->
    index = event.subscribers.indexOf callback
    if index >= 0
      event.subscribers.splice index, 1
      true
    else
      false

  event

module?.exports = pev
@pev = pev
