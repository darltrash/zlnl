#ifdef VERTEX 
    in vec3 a_position;
    in vec4 a_color;
    out vec4 v_col;
    
    void main() {
        v_col = a_color;
        gl_Position = vec4(a_position.xyz, 1.0);
    }
#endif

#ifdef PIXEL
    precision mediump float;
    in vec4 v_col;
    out vec4 out_color;

    void main() {
        out_color = v_col;
    }
#endif
