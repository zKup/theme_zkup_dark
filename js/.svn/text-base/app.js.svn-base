const AJAX_CONTENT = '#ajax-content';

function closeModal() {
    $(AJAX_CONTENT).modal('hide');
}
$(function () {

    if (typeof $.unblockUI !== "undefined" && $.unblockUI !== null) {
        $.unblockUI = closeModal;
    }

    var loadAjax = function (event) {
        var url = $(this).attr('href');
        $(AJAX_CONTENT).html('Chargement en cours…');
        $(AJAX_CONTENT).load(url);
        $(AJAX_CONTENT).modal('show');

        event.preventDefault();
        return false;
    };


    $("a[data-toggle='modal']").live('click', loadAjax);
    $("a.ajax").live('click', loadAjax);

    $("#btn-fermer").live('click', function () {
        closeModal();
    });

    $("input[type=submit]").live('click', function () {
        var caller = $(this);
        caller.hide();
        setTimeout(function () {
            caller.show();
        }, 2000);
        return true;
    });

    $('[data-toggle="tabajax"]').live('click', function (e) {
        e.preventDefault();
        var loadurl = $(this).attr('href');
        var targ = $(this).attr('data-target');
        $(targ).html('chargement en cours');
        $.get(loadurl, function (data) {
            $(targ).html(data);
        });
        $(this).tab('show');
    });

    function autresCellules() {
        var idEquipe = $(this).find('.uneequipe').attr('rel');
        return $('.equipe-' + idEquipe).parents('.eq');
    }

    $("td.eq")
        .mouseenter(function () {
            autresCellules.call(this).css('background-position-y', '-1px');
        })
        .mouseleave(function () {
            autresCellules.call(this).css('background-position-y', '-18px');
        });


    // History

    var History = window.History;

    if (!History.enabled) {
        return false;
    }

    $(window).bind('load statechange', function () {
        var State = History.getState();
        var hash = History.getHash();

        // Our default tab.
        if (!State.data || !State.data.tab) {
            if (hash) {
                State.data.tab = hash;
                window.location.hash = '';
            } else {
                State.data.tab = 'DEFAULT ACTIVE TAB';
            }
        }

        $('ul.nav-tabs > li > a[href="#' + State.data.tab + '"]').tab('show');
    });

    $('a[data-toggle="tab"]').on('shown', function (event) {

        // Set the selected tab to be the current state. But don't update the URL.
        var url = event.target.href.split("#")[0];
        var tab = event.target.href.split("#")[1];

        var State = History.getState();

        // Don't set the state if we haven't changed tabs.
        if (State.data.tab != tab) {
            History.pushState({'tab':tab}, null, url);
        }
    });

    // Ouvre la tab de l'url
    var activeTab = $('[href=' + location.hash + ']');
    activeTab && activeTab.tab('show');

    // Ouvrir les sous menu au survol
    $('ul.nav li.dropdown').hover(function () {
        $(this).closest('.dropdown-menu').stop(true, true).show();
        $(this).addClass('open');
    }, function () {
        $(this).closest('.dropdown-menu').stop(true, true).hide();
        $(this).removeClass('open');
    });
});
