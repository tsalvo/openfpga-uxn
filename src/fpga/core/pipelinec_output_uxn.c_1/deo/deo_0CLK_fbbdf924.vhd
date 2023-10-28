-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 83
entity deo_0CLK_fbbdf924 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_fbbdf924;
architecture arch of deo_0CLK_fbbdf924 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal device_out_result : device_out_result_t := device_out_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;
signal REG_COMB_device_out_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l525_c6_a320]
signal BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l525_c1_2bd3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l530_c7_f5a0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l525_c2_7242]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l525_c2_7242]
signal result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l525_c2_7242]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l525_c2_7242]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l525_c2_7242]
signal result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l525_c2_7242]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l525_c2_7242]
signal result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l525_c2_7242]
signal result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l525_c2_7242]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l525_c2_7242]
signal result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l525_c2_7242]
signal result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l525_c2_7242]
signal device_out_result_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l525_c2_7242_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l525_c2_7242]
signal t8_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l525_c2_7242_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l525_c2_7242]
signal n8_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l525_c2_7242_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l526_c3_bf5f[uxn_opcodes_h_l526_c3_bf5f]
signal printf_uxn_opcodes_h_l526_c3_bf5f_uxn_opcodes_h_l526_c3_bf5f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l530_c11_fd26]
signal BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l533_c7_1126]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l530_c7_f5a0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l530_c7_f5a0]
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l530_c7_f5a0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l530_c7_f5a0]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l530_c7_f5a0]
signal result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l530_c7_f5a0]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l530_c7_f5a0]
signal result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l530_c7_f5a0]
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l530_c7_f5a0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l530_c7_f5a0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l530_c7_f5a0]
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l530_c7_f5a0]
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l530_c7_f5a0]
signal t8_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l530_c7_f5a0]
signal n8_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l533_c11_4bd3]
signal BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l537_c7_e891]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l533_c7_1126]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l533_c7_1126]
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l533_c7_1126]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l533_c7_1126]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l533_c7_1126]
signal result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l533_c7_1126]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l533_c7_1126]
signal result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l533_c7_1126]
signal result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l533_c7_1126]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l533_c7_1126]
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l533_c7_1126]
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l533_c7_1126]
signal device_out_result_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l533_c7_1126_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l533_c7_1126]
signal t8_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c7_1126_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l533_c7_1126]
signal n8_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c7_1126_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l537_c11_c4d9]
signal BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l540_c7_ebee]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l537_c7_e891]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l537_c7_e891]
signal result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l537_c7_e891]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l537_c7_e891]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l537_c7_e891]
signal result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l537_c7_e891]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l537_c7_e891]
signal result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l537_c7_e891]
signal result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l537_c7_e891]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l537_c7_e891]
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l537_c7_e891]
signal result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l537_c7_e891]
signal device_out_result_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l537_c7_e891_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l537_c7_e891]
signal n8_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l537_c7_e891_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l540_c11_923a]
signal BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l545_c1_569a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l540_c7_ebee]
signal result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l540_c7_ebee]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l540_c7_ebee]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l540_c7_ebee]
signal result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l540_c7_ebee]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l540_c7_ebee]
signal result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l540_c7_ebee]
signal result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l540_c7_ebee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l540_c7_ebee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l540_c7_ebee]
signal result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l540_c7_ebee]
signal device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l540_c7_ebee]
signal n8_MUX_uxn_opcodes_h_l540_c7_ebee_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c7_ebee_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l543_c30_0d18]
signal sp_relative_shift_uxn_opcodes_h_l543_c30_0d18_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l543_c30_0d18_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l543_c30_0d18_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l543_c30_0d18_return_output : signed(3 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l547_c42_b75d]
signal BIN_OP_MINUS_uxn_opcodes_h_l547_c42_b75d_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l547_c42_b75d_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l547_c42_b75d_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l547_c23_e563]
signal device_out_uxn_opcodes_h_l547_c23_e563_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l547_c23_e563_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l547_c23_e563_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l547_c23_e563_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l547_c23_e563_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l547_c23_e563_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l547_c23_e563_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_87ba( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.vram_write_layer := ref_toks_4;
      base.vram_address := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;
      base.is_opc_done := ref_toks_10;
      base.is_vram_write := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320
BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_left,
BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_right,
BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242
result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242
result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242
result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242
result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242_cond,
result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242
result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242
result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242_cond,
result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242
result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242_cond,
result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242
result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242
result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242
result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l525_c2_7242
device_out_result_MUX_uxn_opcodes_h_l525_c2_7242 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l525_c2_7242_cond,
device_out_result_MUX_uxn_opcodes_h_l525_c2_7242_iftrue,
device_out_result_MUX_uxn_opcodes_h_l525_c2_7242_iffalse,
device_out_result_MUX_uxn_opcodes_h_l525_c2_7242_return_output);

-- t8_MUX_uxn_opcodes_h_l525_c2_7242
t8_MUX_uxn_opcodes_h_l525_c2_7242 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l525_c2_7242_cond,
t8_MUX_uxn_opcodes_h_l525_c2_7242_iftrue,
t8_MUX_uxn_opcodes_h_l525_c2_7242_iffalse,
t8_MUX_uxn_opcodes_h_l525_c2_7242_return_output);

-- n8_MUX_uxn_opcodes_h_l525_c2_7242
n8_MUX_uxn_opcodes_h_l525_c2_7242 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l525_c2_7242_cond,
n8_MUX_uxn_opcodes_h_l525_c2_7242_iftrue,
n8_MUX_uxn_opcodes_h_l525_c2_7242_iffalse,
n8_MUX_uxn_opcodes_h_l525_c2_7242_return_output);

-- printf_uxn_opcodes_h_l526_c3_bf5f_uxn_opcodes_h_l526_c3_bf5f
printf_uxn_opcodes_h_l526_c3_bf5f_uxn_opcodes_h_l526_c3_bf5f : entity work.printf_uxn_opcodes_h_l526_c3_bf5f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l526_c3_bf5f_uxn_opcodes_h_l526_c3_bf5f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26
BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_left,
BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_right,
BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0
result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0
result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_cond,
result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0
result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0_cond,
result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0
result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0_cond,
result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0
device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0_cond,
device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue,
device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse,
device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output);

-- t8_MUX_uxn_opcodes_h_l530_c7_f5a0
t8_MUX_uxn_opcodes_h_l530_c7_f5a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l530_c7_f5a0_cond,
t8_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue,
t8_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse,
t8_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output);

-- n8_MUX_uxn_opcodes_h_l530_c7_f5a0
n8_MUX_uxn_opcodes_h_l530_c7_f5a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l530_c7_f5a0_cond,
n8_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue,
n8_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse,
n8_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3
BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_left,
BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_right,
BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126
result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126
result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126
result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126_cond,
result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126
result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126_cond,
result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126
result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126_cond,
result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126
result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126
result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l533_c7_1126
device_out_result_MUX_uxn_opcodes_h_l533_c7_1126 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l533_c7_1126_cond,
device_out_result_MUX_uxn_opcodes_h_l533_c7_1126_iftrue,
device_out_result_MUX_uxn_opcodes_h_l533_c7_1126_iffalse,
device_out_result_MUX_uxn_opcodes_h_l533_c7_1126_return_output);

-- t8_MUX_uxn_opcodes_h_l533_c7_1126
t8_MUX_uxn_opcodes_h_l533_c7_1126 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l533_c7_1126_cond,
t8_MUX_uxn_opcodes_h_l533_c7_1126_iftrue,
t8_MUX_uxn_opcodes_h_l533_c7_1126_iffalse,
t8_MUX_uxn_opcodes_h_l533_c7_1126_return_output);

-- n8_MUX_uxn_opcodes_h_l533_c7_1126
n8_MUX_uxn_opcodes_h_l533_c7_1126 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l533_c7_1126_cond,
n8_MUX_uxn_opcodes_h_l533_c7_1126_iftrue,
n8_MUX_uxn_opcodes_h_l533_c7_1126_iffalse,
n8_MUX_uxn_opcodes_h_l533_c7_1126_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9
BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_left,
BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_right,
BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891
result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891
result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891_cond,
result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891
result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891_cond,
result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891
result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891_cond,
result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l537_c7_e891
device_out_result_MUX_uxn_opcodes_h_l537_c7_e891 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l537_c7_e891_cond,
device_out_result_MUX_uxn_opcodes_h_l537_c7_e891_iftrue,
device_out_result_MUX_uxn_opcodes_h_l537_c7_e891_iffalse,
device_out_result_MUX_uxn_opcodes_h_l537_c7_e891_return_output);

-- n8_MUX_uxn_opcodes_h_l537_c7_e891
n8_MUX_uxn_opcodes_h_l537_c7_e891 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l537_c7_e891_cond,
n8_MUX_uxn_opcodes_h_l537_c7_e891_iftrue,
n8_MUX_uxn_opcodes_h_l537_c7_e891_iffalse,
n8_MUX_uxn_opcodes_h_l537_c7_e891_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a
BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_left,
BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_right,
BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee
result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee
result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee_cond,
result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee
result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee_cond,
result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee
result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee_cond,
result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee
device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee_cond,
device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue,
device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse,
device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee_return_output);

-- n8_MUX_uxn_opcodes_h_l540_c7_ebee
n8_MUX_uxn_opcodes_h_l540_c7_ebee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l540_c7_ebee_cond,
n8_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue,
n8_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse,
n8_MUX_uxn_opcodes_h_l540_c7_ebee_return_output);

-- sp_relative_shift_uxn_opcodes_h_l543_c30_0d18
sp_relative_shift_uxn_opcodes_h_l543_c30_0d18 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l543_c30_0d18_ins,
sp_relative_shift_uxn_opcodes_h_l543_c30_0d18_x,
sp_relative_shift_uxn_opcodes_h_l543_c30_0d18_y,
sp_relative_shift_uxn_opcodes_h_l543_c30_0d18_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l547_c42_b75d
BIN_OP_MINUS_uxn_opcodes_h_l547_c42_b75d : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l547_c42_b75d_left,
BIN_OP_MINUS_uxn_opcodes_h_l547_c42_b75d_right,
BIN_OP_MINUS_uxn_opcodes_h_l547_c42_b75d_return_output);

-- device_out_uxn_opcodes_h_l547_c23_e563
device_out_uxn_opcodes_h_l547_c23_e563 : entity work.device_out_0CLK_388fdae8 port map (
clk,
device_out_uxn_opcodes_h_l547_c23_e563_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l547_c23_e563_device_address,
device_out_uxn_opcodes_h_l547_c23_e563_value,
device_out_uxn_opcodes_h_l547_c23_e563_phase,
device_out_uxn_opcodes_h_l547_c23_e563_previous_device_ram_read,
device_out_uxn_opcodes_h_l547_c23_e563_previous_ram_read,
device_out_uxn_opcodes_h_l547_c23_e563_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_device_ram_read,
 previous_ram_read,
 -- Registers
 t8,
 n8,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242_return_output,
 device_out_result_MUX_uxn_opcodes_h_l525_c2_7242_return_output,
 t8_MUX_uxn_opcodes_h_l525_c2_7242_return_output,
 n8_MUX_uxn_opcodes_h_l525_c2_7242_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output,
 device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output,
 t8_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output,
 n8_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126_return_output,
 device_out_result_MUX_uxn_opcodes_h_l533_c7_1126_return_output,
 t8_MUX_uxn_opcodes_h_l533_c7_1126_return_output,
 n8_MUX_uxn_opcodes_h_l533_c7_1126_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891_return_output,
 device_out_result_MUX_uxn_opcodes_h_l537_c7_e891_return_output,
 n8_MUX_uxn_opcodes_h_l537_c7_e891_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee_return_output,
 device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee_return_output,
 n8_MUX_uxn_opcodes_h_l540_c7_ebee_return_output,
 sp_relative_shift_uxn_opcodes_h_l543_c30_0d18_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l547_c42_b75d_return_output,
 device_out_uxn_opcodes_h_l547_c23_e563_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l527_c3_bc13 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_7242_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l525_c2_7242_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l525_c2_7242_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l525_c2_7242_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l525_c2_7242_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l525_c2_7242_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l526_c3_bf5f_uxn_opcodes_h_l526_c3_bf5f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l531_c3_cb65 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_1126_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c7_1126_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c7_1126_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_f5a0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_dbc5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_e891_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c7_1126_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c7_1126_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l537_c7_e891_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c7_1126_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l538_c3_04ad : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l537_c7_e891_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l537_c7_e891_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l537_c7_e891_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c7_ebee_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l537_c7_e891_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a_iffalse : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c7_ebee_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l543_c30_0d18_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l543_c30_0d18_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l543_c30_0d18_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l543_c30_0d18_return_output : signed(3 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l547_c23_e563_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l547_c23_e563_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l547_c23_e563_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l547_c23_e563_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l547_c23_e563_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_b75d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_b75d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_b75d_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l547_c23_e563_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l547_c23_e563_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l548_c32_df56_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l549_c31_4b00_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l550_c21_b69f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l551_c22_4ef2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l552_c26_c1c3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l553_c29_a181_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l554_c25_3b29_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l555_c24_a216_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_bbb8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l537_l533_l530_l525_DUPLICATE_2c51_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_a3e6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_6eaf_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_52ba_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_13d8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_f304_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_3131_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_83b9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l533_l530_l540_DUPLICATE_0a9c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_87ba_uxn_opcodes_h_l520_l558_DUPLICATE_abbf_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
variable REG_VAR_device_out_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
  REG_VAR_device_out_result := device_out_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l538_c3_04ad := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l538_c3_04ad;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l543_c30_0d18_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l543_c30_0d18_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l531_c3_cb65 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l531_c3_cb65;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_right := to_unsigned(4, 3);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_b75d_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_dbc5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_dbc5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l527_c3_bc13 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l527_c3_bc13;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_device_ram_read := previous_device_ram_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_7242_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_1126_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_e891_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l543_c30_0d18_ins := VAR_ins;
     VAR_device_out_uxn_opcodes_h_l547_c23_e563_value := n8;
     VAR_n8_MUX_uxn_opcodes_h_l525_c2_7242_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l533_c7_1126_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l537_c7_e891_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_b75d_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l547_c23_e563_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l547_c23_e563_previous_ram_read := VAR_previous_ram_read;
     VAR_n8_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l533_c7_1126_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l547_c23_e563_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l525_c2_7242_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l533_c7_1126_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l537_c11_c4d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l543_c30_0d18] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l543_c30_0d18_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l543_c30_0d18_ins;
     sp_relative_shift_uxn_opcodes_h_l543_c30_0d18_x <= VAR_sp_relative_shift_uxn_opcodes_h_l543_c30_0d18_x;
     sp_relative_shift_uxn_opcodes_h_l543_c30_0d18_y <= VAR_sp_relative_shift_uxn_opcodes_h_l543_c30_0d18_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l543_c30_0d18_return_output := sp_relative_shift_uxn_opcodes_h_l543_c30_0d18_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l547_c42_b75d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l547_c42_b75d_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_b75d_left;
     BIN_OP_MINUS_uxn_opcodes_h_l547_c42_b75d_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_b75d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_b75d_return_output := BIN_OP_MINUS_uxn_opcodes_h_l547_c42_b75d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_f304 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_f304_return_output := result.u8_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_bbb8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_bbb8_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_6eaf LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_6eaf_return_output := result.vram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_83b9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_83b9_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l533_l530_l540_DUPLICATE_0a9c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l533_l530_l540_DUPLICATE_0a9c_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l537_l533_l530_l525_DUPLICATE_2c51 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l537_l533_l530_l525_DUPLICATE_2c51_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l533_c11_4bd3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_left;
     BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_return_output := BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_3131 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_3131_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l530_c11_fd26] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_left;
     BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_return_output := BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_a3e6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_a3e6_return_output := result.vram_write_layer;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_13d8 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_13d8_return_output := result.u16_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l537_c7_e891] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l537_c7_e891_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_52ba LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_52ba_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l525_c6_a320] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_left;
     BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_return_output := BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l540_c11_923a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_left;
     BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_return_output := BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_7242_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l525_c2_7242_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l525_c2_7242_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_a320_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_f5a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_f5a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_fd26_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_1126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l533_c7_1126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l533_c7_1126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_4bd3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_e891_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l537_c7_e891_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c4d9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l540_c7_ebee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_923a_return_output;
     VAR_device_out_uxn_opcodes_h_l547_c23_e563_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_b75d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_3131_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_3131_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_3131_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_3131_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_3131_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_13d8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_13d8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_13d8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_13d8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_13d8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_52ba_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_52ba_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_52ba_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_52ba_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_52ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l533_l530_l540_DUPLICATE_0a9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l533_l530_l540_DUPLICATE_0a9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l533_l530_l540_DUPLICATE_0a9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l533_l530_l540_DUPLICATE_0a9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l537_l533_l530_l525_DUPLICATE_2c51_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l537_l533_l530_l525_DUPLICATE_2c51_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l537_l533_l530_l525_DUPLICATE_2c51_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l537_l533_l530_l525_DUPLICATE_2c51_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_83b9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_83b9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_83b9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_83b9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_83b9_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_a3e6_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_a3e6_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_a3e6_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_a3e6_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_a3e6_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_6eaf_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_6eaf_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_6eaf_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_6eaf_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_6eaf_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_bbb8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_bbb8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_bbb8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_bbb8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_bbb8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_f304_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_f304_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_f304_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_f304_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l533_l525_l540_l537_l530_DUPLICATE_f304_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l537_c7_e891_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l543_c30_0d18_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l540_c7_ebee] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l537_c7_e891] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891_return_output;

     -- n8_MUX[uxn_opcodes_h_l540_c7_ebee] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l540_c7_ebee_cond <= VAR_n8_MUX_uxn_opcodes_h_l540_c7_ebee_cond;
     n8_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue;
     n8_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l540_c7_ebee_return_output := n8_MUX_uxn_opcodes_h_l540_c7_ebee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l540_c7_ebee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l530_c7_f5a0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l525_c1_2bd3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3_return_output;

     -- t8_MUX[uxn_opcodes_h_l533_c7_1126] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l533_c7_1126_cond <= VAR_t8_MUX_uxn_opcodes_h_l533_c7_1126_cond;
     t8_MUX_uxn_opcodes_h_l533_c7_1126_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l533_c7_1126_iftrue;
     t8_MUX_uxn_opcodes_h_l533_c7_1126_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l533_c7_1126_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l533_c7_1126_return_output := t8_MUX_uxn_opcodes_h_l533_c7_1126_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;
     VAR_printf_uxn_opcodes_h_l526_c3_bf5f_uxn_opcodes_h_l526_c3_bf5f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_2bd3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l537_c7_e891_iffalse := VAR_n8_MUX_uxn_opcodes_h_l540_c7_ebee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_ebee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_ebee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_e891_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l533_c7_1126_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l537_c7_e891] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l537_c7_e891] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891_return_output;

     -- printf_uxn_opcodes_h_l526_c3_bf5f[uxn_opcodes_h_l526_c3_bf5f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l526_c3_bf5f_uxn_opcodes_h_l526_c3_bf5f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l526_c3_bf5f_uxn_opcodes_h_l526_c3_bf5f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l533_c7_1126] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126_return_output;

     -- n8_MUX[uxn_opcodes_h_l537_c7_e891] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l537_c7_e891_cond <= VAR_n8_MUX_uxn_opcodes_h_l537_c7_e891_cond;
     n8_MUX_uxn_opcodes_h_l537_c7_e891_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l537_c7_e891_iftrue;
     n8_MUX_uxn_opcodes_h_l537_c7_e891_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l537_c7_e891_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l537_c7_e891_return_output := n8_MUX_uxn_opcodes_h_l537_c7_e891_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l533_c7_1126] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126_return_output;

     -- t8_MUX[uxn_opcodes_h_l530_c7_f5a0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l530_c7_f5a0_cond <= VAR_t8_MUX_uxn_opcodes_h_l530_c7_f5a0_cond;
     t8_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue;
     t8_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output := t8_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_1126_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l533_c7_1126_iffalse := VAR_n8_MUX_uxn_opcodes_h_l537_c7_e891_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_e891_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_e891_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_1126_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l525_c2_7242_iffalse := VAR_t8_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l533_c7_1126] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126_return_output;

     -- n8_MUX[uxn_opcodes_h_l533_c7_1126] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l533_c7_1126_cond <= VAR_n8_MUX_uxn_opcodes_h_l533_c7_1126_cond;
     n8_MUX_uxn_opcodes_h_l533_c7_1126_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l533_c7_1126_iftrue;
     n8_MUX_uxn_opcodes_h_l533_c7_1126_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l533_c7_1126_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l533_c7_1126_return_output := n8_MUX_uxn_opcodes_h_l533_c7_1126_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l533_c7_1126] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l537_c7_e891] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891_return_output;

     -- t8_MUX[uxn_opcodes_h_l525_c2_7242] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l525_c2_7242_cond <= VAR_t8_MUX_uxn_opcodes_h_l525_c2_7242_cond;
     t8_MUX_uxn_opcodes_h_l525_c2_7242_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l525_c2_7242_iftrue;
     t8_MUX_uxn_opcodes_h_l525_c2_7242_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l525_c2_7242_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l525_c2_7242_return_output := t8_MUX_uxn_opcodes_h_l525_c2_7242_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l530_c7_f5a0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_e891_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l533_c7_1126_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_1126_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_1126_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l525_c2_7242_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l530_c7_f5a0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;

     -- n8_MUX[uxn_opcodes_h_l530_c7_f5a0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l530_c7_f5a0_cond <= VAR_n8_MUX_uxn_opcodes_h_l530_c7_f5a0_cond;
     n8_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue;
     n8_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output := n8_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l530_c7_f5a0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l540_c7_ebee] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l525_c2_7242] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_ebee_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l525_c2_7242_iffalse := VAR_n8_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l545_c1_569a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a_return_output;

     -- n8_MUX[uxn_opcodes_h_l525_c2_7242] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l525_c2_7242_cond <= VAR_n8_MUX_uxn_opcodes_h_l525_c2_7242_cond;
     n8_MUX_uxn_opcodes_h_l525_c2_7242_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l525_c2_7242_iftrue;
     n8_MUX_uxn_opcodes_h_l525_c2_7242_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l525_c2_7242_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l525_c2_7242_return_output := n8_MUX_uxn_opcodes_h_l525_c2_7242_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l525_c2_7242] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l525_c2_7242] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242_return_output;

     -- Submodule level 6
     VAR_device_out_uxn_opcodes_h_l547_c23_e563_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_569a_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l525_c2_7242_return_output;
     -- device_out[uxn_opcodes_h_l547_c23_e563] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l547_c23_e563_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l547_c23_e563_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l547_c23_e563_device_address <= VAR_device_out_uxn_opcodes_h_l547_c23_e563_device_address;
     device_out_uxn_opcodes_h_l547_c23_e563_value <= VAR_device_out_uxn_opcodes_h_l547_c23_e563_value;
     device_out_uxn_opcodes_h_l547_c23_e563_phase <= VAR_device_out_uxn_opcodes_h_l547_c23_e563_phase;
     device_out_uxn_opcodes_h_l547_c23_e563_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l547_c23_e563_previous_device_ram_read;
     device_out_uxn_opcodes_h_l547_c23_e563_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l547_c23_e563_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l547_c23_e563_return_output := device_out_uxn_opcodes_h_l547_c23_e563_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse := VAR_device_out_uxn_opcodes_h_l547_c23_e563_return_output;
     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l554_c25_3b29] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l554_c25_3b29_return_output := VAR_device_out_uxn_opcodes_h_l547_c23_e563_return_output.vram_address;

     -- CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d[uxn_opcodes_h_l551_c22_4ef2] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l551_c22_4ef2_return_output := VAR_device_out_uxn_opcodes_h_l547_c23_e563_return_output.ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l552_c26_c1c3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l552_c26_c1c3_return_output := VAR_device_out_uxn_opcodes_h_l547_c23_e563_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l555_c24_a216] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l555_c24_a216_return_output := VAR_device_out_uxn_opcodes_h_l547_c23_e563_return_output.is_deo_done;

     -- device_out_result_MUX[uxn_opcodes_h_l540_c7_ebee] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee_cond;
     device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee_return_output := device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l553_c29_a181] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l553_c29_a181_return_output := VAR_device_out_uxn_opcodes_h_l547_c23_e563_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l548_c32_df56] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l548_c32_df56_return_output := VAR_device_out_uxn_opcodes_h_l547_c23_e563_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l550_c21_b69f] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l550_c21_b69f_return_output := VAR_device_out_uxn_opcodes_h_l547_c23_e563_return_output.u8_value;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l549_c31_4b00] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l549_c31_4b00_return_output := VAR_device_out_uxn_opcodes_h_l547_c23_e563_return_output.device_ram_address;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l551_c22_4ef2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l555_c24_a216_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l548_c32_df56_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l552_c26_c1c3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l553_c29_a181_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l554_c25_3b29_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l549_c31_4b00_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l550_c21_b69f_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_e891_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_ebee_return_output;
     -- result_vram_write_layer_MUX[uxn_opcodes_h_l540_c7_ebee] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l540_c7_ebee] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l540_c7_ebee] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l540_c7_ebee] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l540_c7_ebee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee_cond;
     result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee_return_output := result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l540_c7_ebee] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee_cond;
     result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee_return_output := result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l540_c7_ebee] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee_cond;
     result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee_return_output := result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l537_c7_e891] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l537_c7_e891_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_e891_cond;
     device_out_result_MUX_uxn_opcodes_h_l537_c7_e891_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_e891_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l537_c7_e891_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_e891_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_e891_return_output := device_out_result_MUX_uxn_opcodes_h_l537_c7_e891_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l540_c7_ebee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee_return_output;

     -- Submodule level 9
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_1126_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_e891_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_ebee_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_ebee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_ebee_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_ebee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_ebee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_ebee_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_ebee_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_ebee_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l537_c7_e891] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l537_c7_e891] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891_cond;
     result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891_return_output := result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l537_c7_e891] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l537_c7_e891] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891_cond;
     result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891_return_output := result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l533_c7_1126] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l533_c7_1126_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_1126_cond;
     device_out_result_MUX_uxn_opcodes_h_l533_c7_1126_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_1126_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l533_c7_1126_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_1126_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_1126_return_output := device_out_result_MUX_uxn_opcodes_h_l533_c7_1126_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l537_c7_e891] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l537_c7_e891] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l537_c7_e891] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l537_c7_e891] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891_cond;
     result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891_return_output := result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891_return_output;

     -- Submodule level 10
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_1126_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_e891_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_e891_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_e891_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_e891_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l537_c7_e891_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_e891_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_e891_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_e891_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l533_c7_1126] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126_cond;
     result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126_return_output := result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l533_c7_1126] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l533_c7_1126] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l530_c7_f5a0] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0_cond;
     device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output := device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l533_c7_1126] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l533_c7_1126] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126_cond;
     result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126_return_output := result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l533_c7_1126] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l533_c7_1126] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l533_c7_1126] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126_cond;
     result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126_return_output := result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126_return_output;

     -- Submodule level 11
     VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_7242_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_1126_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_1126_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_1126_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_1126_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c7_1126_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c7_1126_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_1126_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_1126_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l530_c7_f5a0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l530_c7_f5a0] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l530_c7_f5a0] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l530_c7_f5a0] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l530_c7_f5a0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output := result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l525_c2_7242] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l525_c2_7242_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_7242_cond;
     device_out_result_MUX_uxn_opcodes_h_l525_c2_7242_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_7242_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l525_c2_7242_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_7242_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_7242_return_output := device_out_result_MUX_uxn_opcodes_h_l525_c2_7242_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l530_c7_f5a0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output := result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l530_c7_f5a0] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_cond;
     result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output := result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l530_c7_f5a0] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;

     -- Submodule level 12
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_7242_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f5a0_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l525_c2_7242] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l525_c2_7242] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242_cond;
     result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242_return_output := result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l525_c2_7242] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l525_c2_7242] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l525_c2_7242] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242_cond;
     result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242_return_output := result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l525_c2_7242] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l525_c2_7242] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l525_c2_7242] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242_cond;
     result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242_return_output := result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_87ba_uxn_opcodes_h_l520_l558_DUPLICATE_abbf LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_87ba_uxn_opcodes_h_l520_l558_DUPLICATE_abbf_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_87ba(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_7242_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_7242_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_7242_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_7242_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_7242_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_7242_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l525_c2_7242_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l525_c2_7242_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_7242_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_7242_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_7242_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_87ba_uxn_opcodes_h_l520_l558_DUPLICATE_abbf_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_87ba_uxn_opcodes_h_l520_l558_DUPLICATE_abbf_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
REG_COMB_device_out_result <= REG_VAR_device_out_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
     device_out_result <= REG_COMB_device_out_result;
 end if;
 end if;
end process;

end arch;
