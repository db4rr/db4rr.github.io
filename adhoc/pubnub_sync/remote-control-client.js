var pubnub = PUBNUB({
    publish_key : 'pub-c-7ffe21bd-025f-4e6f-894b-a9e16efff494',
    subscribe_key : 'sub-c-4d8d4422-76af-11e7-91f5-0619f8945a4f'
});

pubnub.subscribe({
    channel : 'output',
    message : function (message, envelope, channelOrGroup, time, channel) {
        jQuery('#display').text(message.slide + '.' + message.part);
    }
});

function buttonCommand(button) {
    pubnub.publish({
        channel : 'input',
        message : {button: button}
    });
}

jQuery(document).ready(function() {
    jQuery('.btn').click(function (eventObject) {
        var targetId = jQuery(this).attr('id');
        buttonCommand(targetId);
    });
});
