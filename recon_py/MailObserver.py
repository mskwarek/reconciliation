import poplib
from email import parser


class MailObserver(object):
    def getMessages(self):
        pop_conn = poplib.POP3_SSL('pop.gmail.com')
        pop_conn.user('')
        pop_conn.pass_('')
        #Get messages from server:
        messages = [pop_conn.retr(i) for i in range(1, len(pop_conn.list()[1]) + 1)]
        # Concat message pieces:
        messages = ["\n".join(mssg[1]) for mssg in messages]
        #Parse message intom an email object:
        messages = [parser.Parser().parsestr(mssg) for mssg in messages]
        for message in messages:
            print message['subject']
        pop_conn.quit()