# Scripts del proyecto

scripts = [
    'run_spkid.sh',
    'plot_gmm_feat.py',
    'spk_verif_score.pl',
    'wav2lp.sh',
<<<<<<< HEAD
    'wav2lpcc.sh'
=======
    'wav2lpcc.sh',
>>>>>>> e2b3d4f715413f50c42c558021627e00622fdfbe
]

foreach script: scripts
    source = join_paths(meson.source_root(), 'scripts', script)     # Ruta completa
    prog = script.split('.')[0]                                     # Nombre sin extensión
    dest = join_paths(get_option('prefix'), get_option('bindir'), prog)
    custom_target(script,
        input : source,
        output : prog,
        command : ['ln', '-sf', source, dest],
        build_by_default: true,
    )
endforeach
