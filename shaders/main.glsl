#ifdef VERTEX 
    in vec3 a_position;
    in vec2 a_texCoord;

    out vec2 TexCoords;

    uniform mat4 model;
    uniform mat4 projection;

    void main()
    {
        TexCoords = a_texCoord;
        gl_Position = projection * model * vec4(a_position, 1.0);
    }
#endif

#ifdef PIXEL
    precision mediump float;
    in vec2 TexCoords;
    out vec4 out_color;

    uniform sampler2D image;
    uniform vec4 mainColor;

    uniform vec4 dark;
    uniform vec4 light;
    uniform float intensity;
    uniform float amount;

    void main()
    {    
        vec4 c = mainColor;// * texture(image, TexCoords);
        float cluma = 1.-dot(c.rgb, vec3(0.299, 0.587, 0.114));
        vec4 o = mix(dark, light, 1.-(cluma*intensity)); //  
        out_color = mix(c, o, amount);
    }  
#endif
