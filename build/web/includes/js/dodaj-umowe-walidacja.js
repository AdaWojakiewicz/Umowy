$(document).ready(function () {
    $('#dodajUmow')
            .form({
                on: 'blur',
                keyboardShortcuts: false,
                inline: true,
                fields: {
                    organizator: {
                        identifier: 'organizator',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Proszę wprowadzić organizatora'
                            }
                        ]
                    },
                    agent: {
                        identifier: 'agent',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Proszę wprowadzić agenta'
                            }
                        ]
                    },
                    numerAgencji: {
                        identifier: 'numerAgencji',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Proszę wprowadzić numer agencji'
                            }
                        ]
                    },
                    numerUmowy: {
                        identifier: 'numerUmowy',
                        rules: [
                            {
                                type: 'empty'
                                
                            }
                        ]
                    },
                    rola: {
                        identifier: 'rola',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Proszę wybrać rolę'
                            }
                        ]
                    }
                }
            })
            ;
});