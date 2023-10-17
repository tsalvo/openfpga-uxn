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
-- Submodules: 78
entity deo_0CLK_e53cbd5e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_e53cbd5e;
architecture arch of deo_0CLK_e53cbd5e is
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
-- BIN_OP_EQ[uxn_opcodes_h_l522_c6_0555]
signal BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l522_c1_de93]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l527_c7_051d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l522_c2_398d]
signal device_out_result_MUX_uxn_opcodes_h_l522_c2_398d_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l522_c2_398d_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l522_c2_398d_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l522_c2_398d_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l522_c2_398d]
signal n8_MUX_uxn_opcodes_h_l522_c2_398d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l522_c2_398d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l522_c2_398d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l522_c2_398d_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l522_c2_398d]
signal t8_MUX_uxn_opcodes_h_l522_c2_398d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l522_c2_398d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l522_c2_398d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l522_c2_398d_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l522_c2_398d]
signal result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l522_c2_398d]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l522_c2_398d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l522_c2_398d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l522_c2_398d]
signal result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l522_c2_398d]
signal result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l522_c2_398d]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l522_c2_398d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l522_c2_398d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l522_c2_398d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l523_c3_0805[uxn_opcodes_h_l523_c3_0805]
signal printf_uxn_opcodes_h_l523_c3_0805_uxn_opcodes_h_l523_c3_0805_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l527_c11_58a9]
signal BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l530_c7_cc36]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l527_c7_051d]
signal device_out_result_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l527_c7_051d_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l527_c7_051d]
signal n8_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l527_c7_051d_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l527_c7_051d]
signal t8_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l527_c7_051d_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l527_c7_051d]
signal result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l527_c7_051d]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l527_c7_051d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l527_c7_051d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l527_c7_051d]
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l527_c7_051d]
signal result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l527_c7_051d]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l527_c7_051d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l527_c7_051d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l527_c7_051d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l530_c11_41e5]
signal BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l534_c7_22f5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l530_c7_cc36]
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l530_c7_cc36]
signal n8_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l530_c7_cc36]
signal t8_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l530_c7_cc36]
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l530_c7_cc36]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l530_c7_cc36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l530_c7_cc36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l530_c7_cc36]
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l530_c7_cc36]
signal result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l530_c7_cc36]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l530_c7_cc36]
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l530_c7_cc36]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l530_c7_cc36]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l534_c11_8f72]
signal BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l537_c7_a140]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l534_c7_22f5]
signal device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l534_c7_22f5]
signal n8_MUX_uxn_opcodes_h_l534_c7_22f5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l534_c7_22f5_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l534_c7_22f5]
signal result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l534_c7_22f5]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l534_c7_22f5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l534_c7_22f5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l534_c7_22f5]
signal result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l534_c7_22f5]
signal result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l534_c7_22f5]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l534_c7_22f5]
signal result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l534_c7_22f5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l534_c7_22f5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l537_c11_094d]
signal BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l542_c1_ab73]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l537_c7_a140]
signal device_out_result_MUX_uxn_opcodes_h_l537_c7_a140_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l537_c7_a140_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l537_c7_a140_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l537_c7_a140_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l537_c7_a140]
signal n8_MUX_uxn_opcodes_h_l537_c7_a140_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l537_c7_a140_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l537_c7_a140_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l537_c7_a140_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l537_c7_a140]
signal result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l537_c7_a140]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l537_c7_a140]
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l537_c7_a140]
signal result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l537_c7_a140]
signal result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l537_c7_a140]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l537_c7_a140]
signal result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l537_c7_a140]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l537_c7_a140]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l540_c30_2f7d]
signal sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d_return_output : signed(3 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l544_c42_ad28]
signal BIN_OP_MINUS_uxn_opcodes_h_l544_c42_ad28_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l544_c42_ad28_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l544_c42_ad28_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l544_c23_e716]
signal device_out_uxn_opcodes_h_l544_c23_e716_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l544_c23_e716_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l544_c23_e716_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l544_c23_e716_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l544_c23_e716_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l544_c23_e716_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_aa08( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_device_ram_write := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.vram_address := ref_toks_6;
      base.vram_write_layer := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;
      base.is_sp_shift := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555
BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_left,
BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_right,
BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l522_c2_398d
device_out_result_MUX_uxn_opcodes_h_l522_c2_398d : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l522_c2_398d_cond,
device_out_result_MUX_uxn_opcodes_h_l522_c2_398d_iftrue,
device_out_result_MUX_uxn_opcodes_h_l522_c2_398d_iffalse,
device_out_result_MUX_uxn_opcodes_h_l522_c2_398d_return_output);

-- n8_MUX_uxn_opcodes_h_l522_c2_398d
n8_MUX_uxn_opcodes_h_l522_c2_398d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l522_c2_398d_cond,
n8_MUX_uxn_opcodes_h_l522_c2_398d_iftrue,
n8_MUX_uxn_opcodes_h_l522_c2_398d_iffalse,
n8_MUX_uxn_opcodes_h_l522_c2_398d_return_output);

-- t8_MUX_uxn_opcodes_h_l522_c2_398d
t8_MUX_uxn_opcodes_h_l522_c2_398d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l522_c2_398d_cond,
t8_MUX_uxn_opcodes_h_l522_c2_398d_iftrue,
t8_MUX_uxn_opcodes_h_l522_c2_398d_iffalse,
t8_MUX_uxn_opcodes_h_l522_c2_398d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d
result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d_cond,
result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d
result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d
result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d
result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d
result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d_cond,
result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d
result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d
result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d
result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d
result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d_return_output);

-- printf_uxn_opcodes_h_l523_c3_0805_uxn_opcodes_h_l523_c3_0805
printf_uxn_opcodes_h_l523_c3_0805_uxn_opcodes_h_l523_c3_0805 : entity work.printf_uxn_opcodes_h_l523_c3_0805_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l523_c3_0805_uxn_opcodes_h_l523_c3_0805_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9
BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_left,
BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_right,
BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l527_c7_051d
device_out_result_MUX_uxn_opcodes_h_l527_c7_051d : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l527_c7_051d_cond,
device_out_result_MUX_uxn_opcodes_h_l527_c7_051d_iftrue,
device_out_result_MUX_uxn_opcodes_h_l527_c7_051d_iffalse,
device_out_result_MUX_uxn_opcodes_h_l527_c7_051d_return_output);

-- n8_MUX_uxn_opcodes_h_l527_c7_051d
n8_MUX_uxn_opcodes_h_l527_c7_051d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l527_c7_051d_cond,
n8_MUX_uxn_opcodes_h_l527_c7_051d_iftrue,
n8_MUX_uxn_opcodes_h_l527_c7_051d_iffalse,
n8_MUX_uxn_opcodes_h_l527_c7_051d_return_output);

-- t8_MUX_uxn_opcodes_h_l527_c7_051d
t8_MUX_uxn_opcodes_h_l527_c7_051d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l527_c7_051d_cond,
t8_MUX_uxn_opcodes_h_l527_c7_051d_iftrue,
t8_MUX_uxn_opcodes_h_l527_c7_051d_iffalse,
t8_MUX_uxn_opcodes_h_l527_c7_051d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d
result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d_cond,
result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d
result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d
result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d
result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d_cond,
result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d
result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d
result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5
BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_left,
BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_right,
BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36
device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36_cond,
device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue,
device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse,
device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36_return_output);

-- n8_MUX_uxn_opcodes_h_l530_c7_cc36
n8_MUX_uxn_opcodes_h_l530_c7_cc36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l530_c7_cc36_cond,
n8_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue,
n8_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse,
n8_MUX_uxn_opcodes_h_l530_c7_cc36_return_output);

-- t8_MUX_uxn_opcodes_h_l530_c7_cc36
t8_MUX_uxn_opcodes_h_l530_c7_cc36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l530_c7_cc36_cond,
t8_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue,
t8_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse,
t8_MUX_uxn_opcodes_h_l530_c7_cc36_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36
result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36_cond,
result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36
result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36_cond,
result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36
result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72
BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_left,
BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_right,
BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5
device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5_cond,
device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue,
device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse,
device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5_return_output);

-- n8_MUX_uxn_opcodes_h_l534_c7_22f5
n8_MUX_uxn_opcodes_h_l534_c7_22f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l534_c7_22f5_cond,
n8_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue,
n8_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse,
n8_MUX_uxn_opcodes_h_l534_c7_22f5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5
result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5_cond,
result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5
result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5
result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5
result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5
result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5_cond,
result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5
result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5
result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5
result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5
result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d
BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_left,
BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_right,
BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l537_c7_a140
device_out_result_MUX_uxn_opcodes_h_l537_c7_a140 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l537_c7_a140_cond,
device_out_result_MUX_uxn_opcodes_h_l537_c7_a140_iftrue,
device_out_result_MUX_uxn_opcodes_h_l537_c7_a140_iffalse,
device_out_result_MUX_uxn_opcodes_h_l537_c7_a140_return_output);

-- n8_MUX_uxn_opcodes_h_l537_c7_a140
n8_MUX_uxn_opcodes_h_l537_c7_a140 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l537_c7_a140_cond,
n8_MUX_uxn_opcodes_h_l537_c7_a140_iftrue,
n8_MUX_uxn_opcodes_h_l537_c7_a140_iffalse,
n8_MUX_uxn_opcodes_h_l537_c7_a140_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140
result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140_cond,
result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140
result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140_cond,
result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140
result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140_return_output);

-- sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d
sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d_ins,
sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d_x,
sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d_y,
sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l544_c42_ad28
BIN_OP_MINUS_uxn_opcodes_h_l544_c42_ad28 : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l544_c42_ad28_left,
BIN_OP_MINUS_uxn_opcodes_h_l544_c42_ad28_right,
BIN_OP_MINUS_uxn_opcodes_h_l544_c42_ad28_return_output);

-- device_out_uxn_opcodes_h_l544_c23_e716
device_out_uxn_opcodes_h_l544_c23_e716 : entity work.device_out_0CLK_b285e9e3 port map (
clk,
device_out_uxn_opcodes_h_l544_c23_e716_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l544_c23_e716_device_address,
device_out_uxn_opcodes_h_l544_c23_e716_value,
device_out_uxn_opcodes_h_l544_c23_e716_phase,
device_out_uxn_opcodes_h_l544_c23_e716_previous_device_ram_read,
device_out_uxn_opcodes_h_l544_c23_e716_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_device_ram_read,
 -- Registers
 t8,
 n8,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d_return_output,
 device_out_result_MUX_uxn_opcodes_h_l522_c2_398d_return_output,
 n8_MUX_uxn_opcodes_h_l522_c2_398d_return_output,
 t8_MUX_uxn_opcodes_h_l522_c2_398d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36_return_output,
 device_out_result_MUX_uxn_opcodes_h_l527_c7_051d_return_output,
 n8_MUX_uxn_opcodes_h_l527_c7_051d_return_output,
 t8_MUX_uxn_opcodes_h_l527_c7_051d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5_return_output,
 device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36_return_output,
 n8_MUX_uxn_opcodes_h_l530_c7_cc36_return_output,
 t8_MUX_uxn_opcodes_h_l530_c7_cc36_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140_return_output,
 device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5_return_output,
 n8_MUX_uxn_opcodes_h_l534_c7_22f5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73_return_output,
 device_out_result_MUX_uxn_opcodes_h_l537_c7_a140_return_output,
 n8_MUX_uxn_opcodes_h_l537_c7_a140_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140_return_output,
 sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l544_c42_ad28_return_output,
 device_out_uxn_opcodes_h_l544_c23_e716_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l522_c2_398d_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l522_c2_398d_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_051d_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l522_c2_398d_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l522_c2_398d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l522_c2_398d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l522_c2_398d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c7_051d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l522_c2_398d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l522_c2_398d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l522_c2_398d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l522_c2_398d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c7_051d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l522_c2_398d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l522_c2_398d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l524_c3_ba07 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l523_c3_0805_uxn_opcodes_h_l523_c3_0805_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l528_c3_cc21 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l534_c7_22f5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l532_c3_ec84 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_a140_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l537_c7_a140_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l534_c7_22f5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_7f31 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l534_c7_22f5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_a140_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_a140_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_a140_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l537_c7_a140_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l537_c7_a140_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l537_c7_a140_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d_return_output : signed(3 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l544_c23_e716_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l544_c23_e716_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l544_c23_e716_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l544_c23_e716_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l544_c42_ad28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l544_c42_ad28_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l544_c42_ad28_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l544_c23_e716_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l544_c23_e716_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l545_c32_f3a3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l546_c31_416d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l547_c21_80b0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l548_c26_c939_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l549_c29_b10c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l550_c25_21e9_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l551_c24_46c5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_2525_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_fc66_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_11e3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_3ba4_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_82ea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_eed1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_0420_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l527_l530_l522_l534_DUPLICATE_4fbf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l527_l530_l534_DUPLICATE_b93e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_aa08_uxn_opcodes_h_l517_l554_DUPLICATE_844c_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l532_c3_ec84 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l532_c3_ec84;
     VAR_sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d_y := resize(to_signed(-2, 3), 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_right := to_unsigned(4, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l544_c42_ad28_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l524_c3_ba07 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l524_c3_ba07;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_7f31 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_7f31;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l528_c3_cc21 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l528_c3_cc21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140_iftrue := to_unsigned(1, 1);

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

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l522_c2_398d_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_051d_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_a140_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d_ins := VAR_ins;
     VAR_device_out_uxn_opcodes_h_l544_c23_e716_value := n8;
     VAR_n8_MUX_uxn_opcodes_h_l522_c2_398d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l527_c7_051d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l537_c7_a140_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l544_c42_ad28_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l544_c23_e716_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_n8_MUX_uxn_opcodes_h_l537_c7_a140_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l544_c23_e716_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l522_c2_398d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l527_c7_051d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_82ea LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_82ea_return_output := result.vram_write_layer;

     -- BIN_OP_EQ[uxn_opcodes_h_l522_c6_0555] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_left;
     BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_return_output := BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_eed1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_eed1_return_output := result.is_vram_write;

     -- BIN_OP_MINUS[uxn_opcodes_h_l544_c42_ad28] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l544_c42_ad28_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l544_c42_ad28_left;
     BIN_OP_MINUS_uxn_opcodes_h_l544_c42_ad28_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l544_c42_ad28_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l544_c42_ad28_return_output := BIN_OP_MINUS_uxn_opcodes_h_l544_c42_ad28_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l527_c11_58a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l530_c11_41e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l534_c7_22f5] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l534_c7_22f5_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_0420 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_0420_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_fc66 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_fc66_return_output := result.is_device_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l540_c30_2f7d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d_ins;
     sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d_x;
     sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d_return_output := sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d_return_output;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_3ba4 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_3ba4_return_output := result.vram_address;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_2525 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_2525_return_output := result.u8_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_11e3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_11e3_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l534_c11_8f72] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_left;
     BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_return_output := BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l527_l530_l522_l534_DUPLICATE_4fbf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l527_l530_l522_l534_DUPLICATE_4fbf_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l537_c11_094d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_left;
     BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_return_output := BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l527_l530_l534_DUPLICATE_b93e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l527_l530_l534_DUPLICATE_b93e_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l522_c2_398d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l522_c2_398d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l522_c2_398d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_0555_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_051d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l527_c7_051d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l527_c7_051d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_58a9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_cc36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_cc36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_41e5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l534_c7_22f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_8f72_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_a140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l537_c7_a140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_094d_return_output;
     VAR_device_out_uxn_opcodes_h_l544_c23_e716_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l544_c42_ad28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_0420_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_0420_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_0420_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_0420_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_0420_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_fc66_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_fc66_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_fc66_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_fc66_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_fc66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l527_l530_l534_DUPLICATE_b93e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l527_l530_l534_DUPLICATE_b93e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l527_l530_l534_DUPLICATE_b93e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l527_l530_l534_DUPLICATE_b93e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l527_l530_l522_l534_DUPLICATE_4fbf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l527_l530_l522_l534_DUPLICATE_4fbf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l527_l530_l522_l534_DUPLICATE_4fbf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l527_l530_l522_l534_DUPLICATE_4fbf_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_eed1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_eed1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_eed1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_eed1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_eed1_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_82ea_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_82ea_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_82ea_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_82ea_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_82ea_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_3ba4_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_3ba4_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_3ba4_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_3ba4_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_3ba4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_11e3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_11e3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_11e3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_11e3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_11e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_2525_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_2525_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_2525_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_2525_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l537_l530_l534_l527_l522_DUPLICATE_2525_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l534_c7_22f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l540_c30_2f7d_return_output;
     -- t8_MUX[uxn_opcodes_h_l530_c7_cc36] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l530_c7_cc36_cond <= VAR_t8_MUX_uxn_opcodes_h_l530_c7_cc36_cond;
     t8_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue;
     t8_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_cc36_return_output := t8_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;

     -- n8_MUX[uxn_opcodes_h_l537_c7_a140] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l537_c7_a140_cond <= VAR_n8_MUX_uxn_opcodes_h_l537_c7_a140_cond;
     n8_MUX_uxn_opcodes_h_l537_c7_a140_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l537_c7_a140_iftrue;
     n8_MUX_uxn_opcodes_h_l537_c7_a140_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l537_c7_a140_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l537_c7_a140_return_output := n8_MUX_uxn_opcodes_h_l537_c7_a140_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l537_c7_a140] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l534_c7_22f5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l537_c7_a140] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l527_c7_051d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l522_c1_de93] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_051d_return_output;
     VAR_printf_uxn_opcodes_h_l523_c3_0805_uxn_opcodes_h_l523_c3_0805_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_de93_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l537_c7_a140_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_a140_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_a140_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_22f5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l527_c7_051d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l534_c7_22f5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l530_c7_cc36] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;

     -- t8_MUX[uxn_opcodes_h_l527_c7_051d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l527_c7_051d_cond <= VAR_t8_MUX_uxn_opcodes_h_l527_c7_051d_cond;
     t8_MUX_uxn_opcodes_h_l527_c7_051d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l527_c7_051d_iftrue;
     t8_MUX_uxn_opcodes_h_l527_c7_051d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l527_c7_051d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l527_c7_051d_return_output := t8_MUX_uxn_opcodes_h_l527_c7_051d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l530_c7_cc36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;

     -- printf_uxn_opcodes_h_l523_c3_0805[uxn_opcodes_h_l523_c3_0805] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l523_c3_0805_uxn_opcodes_h_l523_c3_0805_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l523_c3_0805_uxn_opcodes_h_l523_c3_0805_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n8_MUX[uxn_opcodes_h_l534_c7_22f5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l534_c7_22f5_cond <= VAR_n8_MUX_uxn_opcodes_h_l534_c7_22f5_cond;
     n8_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue;
     n8_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l534_c7_22f5_return_output := n8_MUX_uxn_opcodes_h_l534_c7_22f5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l534_c7_22f5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse := VAR_n8_MUX_uxn_opcodes_h_l534_c7_22f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_22f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_22f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l522_c2_398d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l527_c7_051d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l530_c7_cc36] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l534_c7_22f5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5_return_output;

     -- t8_MUX[uxn_opcodes_h_l522_c2_398d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l522_c2_398d_cond <= VAR_t8_MUX_uxn_opcodes_h_l522_c2_398d_cond;
     t8_MUX_uxn_opcodes_h_l522_c2_398d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l522_c2_398d_iftrue;
     t8_MUX_uxn_opcodes_h_l522_c2_398d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l522_c2_398d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l522_c2_398d_return_output := t8_MUX_uxn_opcodes_h_l522_c2_398d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l530_c7_cc36] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;

     -- n8_MUX[uxn_opcodes_h_l530_c7_cc36] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l530_c7_cc36_cond <= VAR_n8_MUX_uxn_opcodes_h_l530_c7_cc36_cond;
     n8_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue;
     n8_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_cc36_return_output := n8_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l527_c7_051d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_22f5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l527_c7_051d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_051d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l522_c2_398d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l537_c7_a140] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l527_c7_051d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l522_c2_398d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d_return_output;

     -- n8_MUX[uxn_opcodes_h_l527_c7_051d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l527_c7_051d_cond <= VAR_n8_MUX_uxn_opcodes_h_l527_c7_051d_cond;
     n8_MUX_uxn_opcodes_h_l527_c7_051d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l527_c7_051d_iftrue;
     n8_MUX_uxn_opcodes_h_l527_c7_051d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l527_c7_051d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l527_c7_051d_return_output := n8_MUX_uxn_opcodes_h_l527_c7_051d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l527_c7_051d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_a140_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l522_c2_398d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l527_c7_051d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_051d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_051d_return_output;
     -- n8_MUX[uxn_opcodes_h_l522_c2_398d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l522_c2_398d_cond <= VAR_n8_MUX_uxn_opcodes_h_l522_c2_398d_cond;
     n8_MUX_uxn_opcodes_h_l522_c2_398d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l522_c2_398d_iftrue;
     n8_MUX_uxn_opcodes_h_l522_c2_398d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l522_c2_398d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l522_c2_398d_return_output := n8_MUX_uxn_opcodes_h_l522_c2_398d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l542_c1_ab73] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l522_c2_398d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l522_c2_398d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d_return_output;

     -- Submodule level 6
     VAR_device_out_uxn_opcodes_h_l544_c23_e716_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_ab73_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l522_c2_398d_return_output;
     -- device_out[uxn_opcodes_h_l544_c23_e716] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l544_c23_e716_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l544_c23_e716_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l544_c23_e716_device_address <= VAR_device_out_uxn_opcodes_h_l544_c23_e716_device_address;
     device_out_uxn_opcodes_h_l544_c23_e716_value <= VAR_device_out_uxn_opcodes_h_l544_c23_e716_value;
     device_out_uxn_opcodes_h_l544_c23_e716_phase <= VAR_device_out_uxn_opcodes_h_l544_c23_e716_phase;
     device_out_uxn_opcodes_h_l544_c23_e716_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l544_c23_e716_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l544_c23_e716_return_output := device_out_uxn_opcodes_h_l544_c23_e716_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_a140_iffalse := VAR_device_out_uxn_opcodes_h_l544_c23_e716_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l551_c24_46c5] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l551_c24_46c5_return_output := VAR_device_out_uxn_opcodes_h_l544_c23_e716_return_output.is_deo_done;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l546_c31_416d] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l546_c31_416d_return_output := VAR_device_out_uxn_opcodes_h_l544_c23_e716_return_output.device_ram_address;

     -- device_out_result_MUX[uxn_opcodes_h_l537_c7_a140] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l537_c7_a140_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_a140_cond;
     device_out_result_MUX_uxn_opcodes_h_l537_c7_a140_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_a140_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l537_c7_a140_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_a140_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_a140_return_output := device_out_result_MUX_uxn_opcodes_h_l537_c7_a140_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l545_c32_f3a3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l545_c32_f3a3_return_output := VAR_device_out_uxn_opcodes_h_l544_c23_e716_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l548_c26_c939] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l548_c26_c939_return_output := VAR_device_out_uxn_opcodes_h_l544_c23_e716_return_output.is_vram_write;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l550_c25_21e9] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l550_c25_21e9_return_output := VAR_device_out_uxn_opcodes_h_l544_c23_e716_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l549_c29_b10c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l549_c29_b10c_return_output := VAR_device_out_uxn_opcodes_h_l544_c23_e716_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l547_c21_80b0] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l547_c21_80b0_return_output := VAR_device_out_uxn_opcodes_h_l544_c23_e716_return_output.u8_value;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l551_c24_46c5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l545_c32_f3a3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l548_c26_c939_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l549_c29_b10c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l550_c25_21e9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l546_c31_416d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l547_c21_80b0_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_a140_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l537_c7_a140] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l537_c7_a140] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140_cond;
     result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140_return_output := result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l537_c7_a140] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140_cond;
     result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140_return_output := result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l537_c7_a140] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l534_c7_22f5] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5_cond;
     device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5_return_output := device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l537_c7_a140] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l537_c7_a140] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l537_c7_a140] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140_return_output;

     -- Submodule level 9
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_22f5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_a140_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_a140_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_a140_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_a140_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_a140_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_a140_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_a140_return_output;
     -- result_vram_write_layer_MUX[uxn_opcodes_h_l534_c7_22f5] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l534_c7_22f5] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5_cond;
     result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5_return_output := result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l534_c7_22f5] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l530_c7_cc36] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36_cond;
     device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36_return_output := device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l534_c7_22f5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5_return_output := result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l534_c7_22f5] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l534_c7_22f5] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l534_c7_22f5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5_return_output;

     -- Submodule level 10
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_051d_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_22f5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_22f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_22f5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_22f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_22f5_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_22f5_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_22f5_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l530_c7_cc36] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36_cond;
     result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36_return_output := result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l530_c7_cc36] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l527_c7_051d] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l527_c7_051d_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_051d_cond;
     device_out_result_MUX_uxn_opcodes_h_l527_c7_051d_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_051d_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l527_c7_051d_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_051d_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_051d_return_output := device_out_result_MUX_uxn_opcodes_h_l527_c7_051d_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l530_c7_cc36] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l530_c7_cc36] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l530_c7_cc36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l530_c7_cc36] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36_cond;
     result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36_return_output := result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l530_c7_cc36] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;

     -- Submodule level 11
     VAR_device_out_result_MUX_uxn_opcodes_h_l522_c2_398d_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_051d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_cc36_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l527_c7_051d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l527_c7_051d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l527_c7_051d] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d_cond;
     result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d_return_output := result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l527_c7_051d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d_return_output := result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l527_c7_051d] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l522_c2_398d] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l522_c2_398d_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l522_c2_398d_cond;
     device_out_result_MUX_uxn_opcodes_h_l522_c2_398d_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l522_c2_398d_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l522_c2_398d_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l522_c2_398d_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l522_c2_398d_return_output := device_out_result_MUX_uxn_opcodes_h_l522_c2_398d_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l527_c7_051d] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l527_c7_051d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d_return_output;

     -- Submodule level 12
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l522_c2_398d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_051d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_051d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_051d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_051d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_051d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c7_051d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_051d_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l522_c2_398d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l522_c2_398d] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d_cond;
     result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d_return_output := result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l522_c2_398d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l522_c2_398d] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l522_c2_398d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d_return_output := result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l522_c2_398d] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l522_c2_398d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_aa08_uxn_opcodes_h_l517_l554_DUPLICATE_844c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_aa08_uxn_opcodes_h_l517_l554_DUPLICATE_844c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_aa08(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l522_c2_398d_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_398d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_398d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_398d_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_398d_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c2_398d_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_398d_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_398d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_398d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_398d_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_aa08_uxn_opcodes_h_l517_l554_DUPLICATE_844c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_aa08_uxn_opcodes_h_l517_l554_DUPLICATE_844c_return_output;
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
