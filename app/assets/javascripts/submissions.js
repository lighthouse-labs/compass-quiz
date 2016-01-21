$(function () {
  $('#new_submission').find('[name="student[github_username]"]').on('keypress', function (e) {
    if (e.keyCode === 13) e.preventDefault();
  })
});
