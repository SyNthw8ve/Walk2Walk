package com.walk2walk.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.util.concurrent.ListenableFuture;
import org.springframework.util.concurrent.ListenableFutureCallback;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PositionController {

    @Value(value = "${message.topic.name}")
    private String topicName;

    @Autowired
    private KafkaTemplate<String, Position> kafkaTemplate;

    @PostMapping(value = "/api/position", consumes = "application/json", produces = "application/json")
    public void sendMessage(@RequestBody Position position) {

        ListenableFuture<SendResult<String, Position>> future = kafkaTemplate.send(topicName, position);

        future.addCallback(new ListenableFutureCallback<SendResult<String, Position>>() {

            @Override
            public void onSuccess(SendResult<String, Position> result) {

                System.out.println(
                        "Sent message=[" + position + "] with offset=[" + result.getRecordMetadata().offset() + "]");
            }

            @Override
            public void onFailure(Throwable t) {

                System.out.println("Unable to send message=[" + position + "] due to : " + t.getMessage());
            }
        });
    }

    @KafkaListener(topics = "positions", groupId = "positions", containerFactory = "kafkaListenerContainerFactory")
    public void listen(String message) {
        System.out.println("Received Messasge in group foo: " + message);
    }
}