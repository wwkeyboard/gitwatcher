var viewModel = {
    showCommit : function (url, id) {
        commit = $(id).children('article.commit');
        if(commit.size() > 0){
            commit.show();
            viewModel.toggleShow(id);
        } else {
            viewModel.pullCommit(url, id);
        }
    },

    pullCommit : function (url, id) {
        $.ajax({ url: url,
                 context: document.body,
                 success: function(response) { 
                     $(id).append(response); 
                     viewModel.toggleShow(id);
                 }
               });
        return(false);
    },

    toggleShow : function (id) {
        $(id).children('.show').toggle();
        $(id).children('.hide').toggle();
    },

    hideCommit : function (id) {
        viewModel.toggleShow(id);
        $(id).children('article.commit').hide();
    },
    
    repositories : function () {
        $.unique( 
            $('.repo').map(
                function(){ 
                    return $(this).contents().text();
                }
            )
        );
    }
};

$(document).ready(function() {
    $('.hide').hide();
    jQuery("abbr.timeago").timeago();
    ko.applyBindings(viewModel);
});