guard 'test' do
  watch(%r{lib/(.*)\.rb})      { |m| "test/#{m[1]}_test.rb" }
  watch(%r{test/.*_test\.rb})
  watch('test/test_helper.rb') { "test" }

  # Rails example
  watch(%r{app/models/(.*)\.rb})                     { |m| "test/unit/#{m[1]}_test.rb" }
  watch(%r{app/controllers/(.*)\.rb})                { |m| "test/functional/#{m[1]}_test.rb" }
  watch(%r{app/views/.*\.rb})                        { "test/integration" }
  watch('app/controllers/application_controller.rb') { ["test/functional", "test/integration"] }
end

guard 'minitest' do
  # with Minitest::Unit
  watch(%r{^test/test_(.*).rb})
  watch(%r{^lib/(.*)([^/]+)\.rb})                       { |m| "test/#{m[1]}test_#{m[2]}.rb" }
  watch(%r{^test/test_helper.rb})                       { "test" }

  # with Minitest::Spec
  # watch('^spec/(.*)_spec.rb')
  # watch('^lib/(.*)\.rb')                            { |m| "spec/#{m[1]}_spec.rb" }
  # watch('^spec/spec_helper.rb')                     { "spec" }
end
