pev - Promised Event
=======================================

simple event with Promise

Install
---------------------------------------
```
npm install pev
```

```
bower install pev
```

Usage
---------------------------------------

### javascript
```javascript
// new event
var event = pev();

// subscribe listener 1
var disposable = event.add(function(args){
  console.log(args[0]);
  return 42; // plain value or thenable
});

// subscribe listener 2
var disposable2 = event.add(callback);

// trigger
var thenable = event(100).then(function(results){
  console.log(results[0]);
});

// unsubscribe listener 1
var succeed = disposable();

// unsubscribe listener 2
var succeed2 = event.del(callback);

// unsubscribe all listeners
event.clear();
```

### coffee-script
```coffee
# new event
event = pev();

# subscribe listener 1
disposable = event.add (args) ->
  console.log(args[0])
  42 # plain value or thenable

# subscribe listener 2
disposable2 = event.add(callback)

# trigger
thenable = event(100).then (results) ->
  console.log results[0]

# unsubscribe listener 1
succeed = disposable()

# unsubscribe listener 2
succeed2 = event.del(callback)

# unsubscribe all listeners
event.clear()
```

### coffee-script class
```coffee
class Foo
  constructor: ->
    @onOpen = pev()
    @onClose = pev()
  open: (flag, value) ->
    @onOpen(flag, value).then (results) -> console.log('opened!')
  close: ->
    @onClose().then (results) ->
      @_clear()
  _clear: ->
    @onOpen.clear()
    @onClose.clear()

foo = new Foo()

foo.onOpen.add ([flag, value]) ->
  console.log('onOpen', flag, value);

foo.open(true, 42).then -> foo.close()
```

License
---------------------------------------
This is released under [MIT License](http://narazaka.net/license/MIT?2015).
