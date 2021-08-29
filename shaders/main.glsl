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
    uniform vec4 spriteColor;

    void main()
    {    
        out_color = vec4(TexCoords, 1, 1);// * texture(image, TexCoords);
    }  
#endif
