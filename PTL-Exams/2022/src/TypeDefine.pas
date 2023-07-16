unit TypeDefine;

interface

    type
        t_person = record
            name:string;
            age:byte;
        end;
        tp_personNode = ^t_personNode;
        t_personNode = record
            person:t_person;
            next:tp_personNode;
        end;

implementation
end.