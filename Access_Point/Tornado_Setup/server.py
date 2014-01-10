import tornado.ioloop
import tornado.web
import serial

class MainHandler(tornado.web.RequestHandler):
  def get(self):
    self.write("<img src='/home/pi/ocr_pi.png' alt='nothign'>")

application = tornado.web.Application([
  (r"/", MainHandler),
])

if __name__ == "__main__":
  application.listen(8080)
  tornado.ioloop.IOLoop.instance().start()
