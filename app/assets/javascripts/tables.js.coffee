$ ->
  $('.delete_row').on 'ajax:success', ->
    $(@).closest('tr').fadeOut()
