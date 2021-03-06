#version 130

uniform vec4 time;
uniform sampler2D tex0;
uniform sampler2D tex1;

in vec3 Color;
in vec2 Texcoord;

out vec4 out_color;

vec2 rotate(vec2 p)
{
    return vec2(atan(p.y / p.x), 1. / length(p));
}

void main()
{
    vec2 pos = gl_FragCoord.xy / vec2(800, 400) * 2. - 1.;

    pos = rotate(pos);

    vec2 f = floor(pos * time.w);

    float d = f.x + f.y;
    float Time = time.y;

    vec4 t0 = texture(tex0, Texcoord);
    vec4 t1 = texture(tex1, Texcoord);

    out_color = mix(t0, t1, 0.4) *   vec4(sin(d + Time),
                                          sin(d + Time * 1.2),
                                          sin(d + Time * 1.3),
                                          1.0);
}


