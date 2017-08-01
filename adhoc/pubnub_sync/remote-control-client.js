var pubnub = new PubNub({
    publishKey: 'pub-c-4b844d24-d357-4c0a-aeaa-b82e30decead',
    subscribeKey: 'sub-c-56c04294-b696-11e6-b37b-02ee2ddab7fe',
    ssl: true
});

pubnub.addListener({
    message: function(event) {
        var message = event.message;
        jQuery('#display').text(message.slide + '.' + message.part);
    }
});

pubnub.subscribe({
    channels: ['output']
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
