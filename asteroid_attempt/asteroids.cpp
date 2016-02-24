#include <GL/glut.h>
#include <GL/glu.h>
#include <GL/gl.h>
#include <X11/Xlib.h>
#include <GL/glx.h>
#include <stdlib.h>

static GLfloat spin = 0.0;
static GLfloat speed = 0.01;
static GLfloat originX = 0.49;
static GLfloat originY = 0.41;

void display(void){
   glClearColor (0.0, 0.0, 0.0, 0.0);
   glClear (GL_COLOR_BUFFER_BIT);
   glPushMatrix();
   glRotatef(spin, 0.0, 0.0, 1.0);
   glColor3f (1.0, 1.0, 1.0);
   //glOrtho(0.0, 1.0, 0.0, 1.0, -1.0, 1.0);
   glLineWidth(2.5);
   glBegin(GL_LINES);
      glVertex3f (originX - 0.02, originY, 0.0);
      glVertex3f (originX - 0.01, originY + 0.06,0.0);
      glVertex3f (originX - 0.01, originY + 0.06,0.0);
      glVertex3f (originX, originY,0.0);
      glVertex3f (originX - 0.018, originY + 0.01,0.0);
      glVertex3f (originX - 0.002, originY + 0.01,0.0);
   glEnd();
   glFlush();
   glPopMatrix();
   glutSwapBuffers();
}


void init (void) {
//  select clearing (background) color 
    glClearColor (0.0, 0.0, 0.0, 0.0);

//  initialize viewing values  
    //glShadeModel (GL_FLAT);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(0.0, 1.0, 0.0, 1.0, -1.0, 1.0);
}


void control(unsigned char Key, int x, int y) {
   switch (Key) {
      case 'w':
            originY = originY + speed;
            if(speed < 0.03){
               speed = speed + 0.001;
            }
         break;
      case 's':
            originY = originY - speed;
            if(speed < 0.03){
               speed = speed + 0.001;
            }
         break;
      case 'd':
            spin = spin + 2.0;
            if (spin > 360.0)
               spin = spin - 360.0;
      case 'a':
           spin = spin + 2.0;
           if (spin > 360.0)
             spin = spin - 360.0;
      default:
         break;
   }
  glutPostRedisplay();
}

int main(int argc, char** argv) {
   glutInit(&argc, argv);
   glutInitWindowSize (800,500);
   glutInitDisplayMode (GLUT_DOUBLE | GLUT_RGB);
   glutInitWindowPosition (100, 100);
   glutCreateWindow ("Asteroids");
   init ();
   glutDisplayFunc(display);
   glutKeyboardFunc(control);
   glutMainLoop();
   return 0;
}
