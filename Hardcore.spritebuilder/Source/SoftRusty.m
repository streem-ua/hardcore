#import "SoftRusty.h"
#import "cocos2d.h"
#import "CCTexture_Private.h"

static const int NUM_SEGMENTS = 20;
static const float PHYSICS_BODY_RADIUS = 4;
static const float INNER_STIFFNESS = 1500;
static const float INNER_DAMPING = 50;
static const float OUTER_STIFFNESS = 1000;
static const float OUTER_DAMPING = 50;

@implementation SoftRusty

- (id)initWithImageNamed:(NSString*)imageName;
{
    self = [super initWithImageNamed:imageName];
    if (self) {
        // Bubble radius is the the texture half-width
        float bubbleRadius = self.contentSize.width/2;
        
        // Main body at the center of the bubble
        self.physicsBody = [CCPhysicsBody bodyWithCircleOfRadius:PHYSICS_BODY_RADIUS andCenter:CGPointMake(bubbleRadius, bubbleRadius)];
        self.physicsBody.allowsRotation = false;
        
        // Distance between main body and outer children
        float childDist = bubbleRadius - PHYSICS_BODY_RADIUS;
        
        // Create child bodies connected to the main body with inner springs
        for(int i=0; i<NUM_SEGMENTS; i++) {
            float childAngle = i * 2 * M_PI / NUM_SEGMENTS;
            
            CCNode *child = [CCNode node];
            child.physicsBody = [CCPhysicsBody bodyWithCircleOfRadius:PHYSICS_BODY_RADIUS andCenter:CGPointZero];
            child.physicsBody.allowsRotation = false;
            child.position = ccp(bubbleRadius + childDist * cosf(childAngle), bubbleRadius + childDist * sinf(childAngle));
            [self addChild:child];
            
            [CCPhysicsJoint connectedSpringJointWithBodyA:self.physicsBody
                                                    bodyB:child.physicsBody
                                                  anchorA:CGPointMake(bubbleRadius, bubbleRadius)
                                                  anchorB:CGPointZero
                                               restLength:childDist
                                                stiffness:INNER_STIFFNESS damping:INNER_DAMPING];
        }
        
        // Connect child bodies together with outer springs
        for(int i=0; i<NUM_SEGMENTS; i++) {
            CCNode *previous = i==0 ? self.children[NUM_SEGMENTS-1] : self.children[i-1];
            CCNode *child = self.children[i];
            [CCPhysicsJoint connectedSpringJointWithBodyA:child.physicsBody
                                                    bodyB:previous.physicsBody
                                                  anchorA:CGPointZero
                                                  anchorB:CGPointZero
                                               restLength:childDist*2*M_PI/NUM_SEGMENTS
                                                stiffness:OUTER_STIFFNESS
                                                  damping:OUTER_DAMPING];
        }
    }
    return self;
}

// Map the texture on the physics bodies with a triangle fan
- (void) draw {
    int nVertices = NUM_SEGMENTS+2;
    
    float deltaAngle = (2.f * M_PI) / NUM_SEGMENTS;
    float bubbleRadius = self.contentSize.width/2;
    
    // Triangle fan vertices
    ccVertex2F vertices[nVertices];
    vertices[0] = (ccVertex2F){bubbleRadius, bubbleRadius};
    for (int i = 0; i < NUM_SEGMENTS; i++) {
        CCNode *child = self.children[i];
        vertices[i+1] = (ccVertex2F){
            child.position.x + PHYSICS_BODY_RADIUS * (child.position.x-bubbleRadius)/bubbleRadius,
            child.position.y + PHYSICS_BODY_RADIUS * (child.position.y-bubbleRadius)/bubbleRadius
        };
    }
    vertices[NUM_SEGMENTS+1] = vertices[1];
    
    // Corresponding texture coordinates
    ccVertex2F texCoords[nVertices];
    texCoords[0] = (ccVertex2F){0.5f, 0.5f};
    for (int i = 0; i < NUM_SEGMENTS; i++) {
        GLfloat coordAngle = M_PI + (deltaAngle * i);
        texCoords[i+1] = (ccVertex2F){0.5 + cosf(coordAngle)*0.5, 0.5 + sinf(coordAngle)*0.5};
    }
    texCoords[NUM_SEGMENTS+1] = texCoords[1];
    
    // Default colors
    ccColor4F colors[nVertices];
    for (int i = 0; i <= NUM_SEGMENTS+1; i++) {
        colors[i] = (ccColor4F){1, 1, 1, 1};
    }
    
    // Draw the triangle fan
   
//    CC_NODE_DRAW_SETUP();
//    ccGLBlendFunc(self.blendFunc.src, self.blendFunc.dst);
    self.blendMode    = [CCBlendMode blendModeWithOptions:@{
                                                                    CCBlendFuncSrcColor : @(GL_SRC_COLOR),
                                                                    CCBlendFuncDstColor : @(GL_DST_COLOR),}
                                 ];
    //ccGLBindTexture2D(self.texture.name);
    glBindTexture(1, self.texture.name);
    
//    ccGLEnableVertexAttribs( kCCVertexAttribFlag_PosColorTex );
//    glVertexAttribPointer(kCCVertexAttrib_Position, 2, GL_FLOAT, GL_FALSE, 0, vertices);
//    glVertexAttribPointer(kCCVertexAttrib_TexCoords, 2, GL_FLOAT, GL_FALSE, 0, texCoords);
//    glVertexAttribPointer(kCCVertexAttrib_Color, 4, GL_FLOAT, GL_TRUE, 0, colors);
//    
    glDrawArrays(GL_TRIANGLE_FAN, 0, (GLsizei)nVertices);
}

@end