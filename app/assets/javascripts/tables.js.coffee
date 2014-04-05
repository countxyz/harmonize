$ ->
  $('.delete_project').on 'ajax:success', ->
    $(@).closest('tr').fadeOut()
