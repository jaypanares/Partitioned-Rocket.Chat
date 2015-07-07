Meteor.methods
  setDefaultGroup: ->
    console.log this.userId
    if not Partitioner.group()?
      Partitioner.setUserGroup(this.userId, 'lobby')
