#include <iostream>

#include <osg/ref_ptr>
#include <osgViewer/Viewer>

int main(int, char**){

    osgViewer::Viewer viewer;

    osg::Camera* cam = viewer.getCamera();
    cam->setClearColor(osg::Vec4(1.0f, 1.0f, 1.0f, 0.f));
    cam->setClearMask(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    return viewer.run();
}
