$ ->
  $new_comment_modal = $('#new-comment-modal')
  $('#new-comment').on 'click', ->
    $new_comment_modal.addClass('active')

  $('#new-comment-modal button').on 'click', ->
    $new_comment_modal.removeClass('active')
