# PEON - Orchestrator

![André Kent - Artstation](https://cdna.artstation.com/p/assets/images/images/023/913/316/large/andre-kent-peon-turntable.jpg)

## The Easy Game Server Manager

### [Peon Project](https://github.com/nox-noctua-consulting/peon)

An **OpenSource** project to assist gamers in self deploying/managing game servers.\
Intended to be a one-stop-shop for game server deployment/management.\
If run on a public/paid cloud, it is architected to try minimise costs (easy schedule/manage uptime vs downtime)

### Peon Orchestrator (peon.orc)

The [github](https://github.com/nox-noctua-consulting/peon-orc/) repo for developing the peon server orchestrator.

## State

> **EARLY DEVELOPMENT**

Basic start/stop/restart/deploy/delete server functionality working

## Version Info

Check [changelog](https://github.com/nox-noctua-consulting/peon-orc/blob/master/changelog.md) for more information

- Deployed with ``python:3.9-slim-bullseye`` as base image
- Using ``flask-restful`` as a framework to handle the API.
- Using ``docker-py`` for container management

### Known Bugs

-

### Architecture/Rules

Orchestrator (PeonOrc) built as a docker image for easy deployment.

### Feature Plan

#### *sprint 0.1.0*

- [x] RESTapi (v1)
- [x] Server deployment (v1)

#### *sprint 0.2.0*

- [x] RESTapi (v2) - custom configurations
- [x] Server deployment (v2) - custom configurations

#### *sprint 0.3.0*

- [ ] Persistent server data - Keep server data for updates & future releases.
- [ ] Backups

#### Notes

[HTML Response Codes](https://www.restapitutorial.com/httpstatuscodes.html)

#### API

RESTful API

##### URL

{{peon_orchestrator_url}}:{{api_port}}/api/1.0/servers

##### Servers

Actions for multiple servers/server creation

##### Server

#### API Examples

##### Create server

Payload

```json
{
    "game_uid": "valhiem",
    "servername": "server01",
    "description": "A valhiem PEON server",
    "settings": [{
            "type": "env",
            "name": "container environment",
            "content": {
                "SERVERNAME": "My-Valhiem-Server",
                "WORLDNAME": "awesomeworld",
                "PASSWORD": "password123"
            }
        },
        {
            "type": "json",
            "name": "config.json",
            "content": {
                "somekey": "somevalue"
            }
        },
        {
            "type": "txt",
            "name": "textfile.txt",
            "content": "Some random text. With a \ttabspace & and a \nnewline."
        }
    ]
}
```
