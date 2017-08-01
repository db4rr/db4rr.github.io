var pubnub = PUBNUB({
    publish_key : 'pub-c-4b844d24-d357-4c0a-aeaa-b82e30decead',
    subscribe_key : 'sub-c-56c04294-b696-11e6-b37b-02ee2ddab7fe'
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
