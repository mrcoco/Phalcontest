$(document).ready(function()
{

    $('#basic').on('show.bs.modal', function(e) {

        var filename = $(e.relatedTarget).data('id');
        $("#filename").val( filename );

    });

    $("#deletebutton").click(function()
    {
        var filename =$("#filename").val();
        var galleryid = $("#filename").data('name');
        var l = window.location;
        var base_url = l.protocol + "//" + l.host + "/" + l.pathname.split('/')[1];
        var url_path =base_url+'/gallery/delete/'+galleryid+'/'+filename;

        $.ajax
        ({
            type: "POST",
            url: url_path,
            data:{},
            cache: false,
            success: function(data)
            {
                $('#basic').modal('hide')
                location.reload();
            }
        });

    });

});
