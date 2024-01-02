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
-- Submodules: 40
entity deo_0CLK_ebde644c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_ebde644c;
architecture arch of deo_0CLK_ebde644c is
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
-- BIN_OP_EQ[uxn_opcodes_h_l497_c6_6484]
signal BIN_OP_EQ_uxn_opcodes_h_l497_c6_6484_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l497_c6_6484_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l497_c6_6484_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l510_c7_bf06]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l497_c2_8ebe]
signal n8_MUX_uxn_opcodes_h_l497_c2_8ebe_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l497_c2_8ebe_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l497_c2_8ebe_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l497_c2_8ebe]
signal t8_MUX_uxn_opcodes_h_l497_c2_8ebe_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l497_c2_8ebe_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l497_c2_8ebe_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l497_c2_8ebe]
signal result_MUX_uxn_opcodes_h_l497_c2_8ebe_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l497_c2_8ebe_iftrue : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l497_c2_8ebe_iffalse : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output : opcode_result_t;

-- device_out_result_MUX[uxn_opcodes_h_l497_c2_8ebe]
signal device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l510_c11_82dc]
signal BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l513_c7_3cb3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l510_c7_bf06]
signal n8_MUX_uxn_opcodes_h_l510_c7_bf06_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l510_c7_bf06_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l510_c7_bf06]
signal t8_MUX_uxn_opcodes_h_l510_c7_bf06_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l510_c7_bf06_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l510_c7_bf06]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l510_c7_bf06]
signal result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l510_c7_bf06]
signal result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l510_c7_bf06]
signal result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l510_c7_bf06]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06_return_output : unsigned(3 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l510_c7_bf06]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l510_c7_bf06]
signal result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l510_c7_bf06]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l510_c7_bf06]
signal result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l510_c7_bf06]
signal device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l513_c11_20a8]
signal BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l517_c1_1740]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l513_c7_3cb3]
signal n8_MUX_uxn_opcodes_h_l513_c7_3cb3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l513_c7_3cb3]
signal t8_MUX_uxn_opcodes_h_l513_c7_3cb3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l513_c7_3cb3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l513_c7_3cb3]
signal result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l513_c7_3cb3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l513_c7_3cb3]
signal result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l513_c7_3cb3]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l513_c7_3cb3]
signal result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l513_c7_3cb3]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l513_c7_3cb3]
signal result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l513_c7_3cb3]
signal device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output : device_out_result_t;

-- sp_relative_shift[uxn_opcodes_h_l515_c30_1e5f]
signal sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l519_c9_8f4f]
signal BIN_OP_EQ_uxn_opcodes_h_l519_c9_8f4f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l519_c9_8f4f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l519_c9_8f4f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l519_c9_c348]
signal MUX_uxn_opcodes_h_l519_c9_c348_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l519_c9_c348_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l519_c9_c348_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l519_c9_c348_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l520_c42_c385]
signal BIN_OP_MINUS_uxn_opcodes_h_l520_c42_c385_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l520_c42_c385_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l520_c42_c385_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l520_c23_9875]
signal device_out_uxn_opcodes_h_l520_c23_9875_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_9875_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_9875_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_9875_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_9875_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_9875_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_9875_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_4770( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_ae33( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.vram_write_layer := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.is_device_ram_write := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l497_c6_6484
BIN_OP_EQ_uxn_opcodes_h_l497_c6_6484 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l497_c6_6484_left,
BIN_OP_EQ_uxn_opcodes_h_l497_c6_6484_right,
BIN_OP_EQ_uxn_opcodes_h_l497_c6_6484_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06_return_output);

-- n8_MUX_uxn_opcodes_h_l497_c2_8ebe
n8_MUX_uxn_opcodes_h_l497_c2_8ebe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l497_c2_8ebe_cond,
n8_MUX_uxn_opcodes_h_l497_c2_8ebe_iftrue,
n8_MUX_uxn_opcodes_h_l497_c2_8ebe_iffalse,
n8_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output);

-- t8_MUX_uxn_opcodes_h_l497_c2_8ebe
t8_MUX_uxn_opcodes_h_l497_c2_8ebe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l497_c2_8ebe_cond,
t8_MUX_uxn_opcodes_h_l497_c2_8ebe_iftrue,
t8_MUX_uxn_opcodes_h_l497_c2_8ebe_iffalse,
t8_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output);

-- result_MUX_uxn_opcodes_h_l497_c2_8ebe
result_MUX_uxn_opcodes_h_l497_c2_8ebe : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l497_c2_8ebe_cond,
result_MUX_uxn_opcodes_h_l497_c2_8ebe_iftrue,
result_MUX_uxn_opcodes_h_l497_c2_8ebe_iffalse,
result_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe
device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe_cond,
device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe_iftrue,
device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe_iffalse,
device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc
BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_left,
BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_right,
BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output);

-- n8_MUX_uxn_opcodes_h_l510_c7_bf06
n8_MUX_uxn_opcodes_h_l510_c7_bf06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l510_c7_bf06_cond,
n8_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue,
n8_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse,
n8_MUX_uxn_opcodes_h_l510_c7_bf06_return_output);

-- t8_MUX_uxn_opcodes_h_l510_c7_bf06
t8_MUX_uxn_opcodes_h_l510_c7_bf06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l510_c7_bf06_cond,
t8_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue,
t8_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse,
t8_MUX_uxn_opcodes_h_l510_c7_bf06_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06
result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06_cond,
result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06
result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06_cond,
result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06
device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06_cond,
device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue,
device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse,
device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8
BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_left,
BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_right,
BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740_return_output);

-- n8_MUX_uxn_opcodes_h_l513_c7_3cb3
n8_MUX_uxn_opcodes_h_l513_c7_3cb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l513_c7_3cb3_cond,
n8_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue,
n8_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse,
n8_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output);

-- t8_MUX_uxn_opcodes_h_l513_c7_3cb3
t8_MUX_uxn_opcodes_h_l513_c7_3cb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l513_c7_3cb3_cond,
t8_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue,
t8_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse,
t8_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3
result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3_cond,
result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3
result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3_cond,
result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3
device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3_cond,
device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue,
device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse,
device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output);

-- sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f
sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f_ins,
sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f_x,
sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f_y,
sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l519_c9_8f4f
BIN_OP_EQ_uxn_opcodes_h_l519_c9_8f4f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l519_c9_8f4f_left,
BIN_OP_EQ_uxn_opcodes_h_l519_c9_8f4f_right,
BIN_OP_EQ_uxn_opcodes_h_l519_c9_8f4f_return_output);

-- MUX_uxn_opcodes_h_l519_c9_c348
MUX_uxn_opcodes_h_l519_c9_c348 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l519_c9_c348_cond,
MUX_uxn_opcodes_h_l519_c9_c348_iftrue,
MUX_uxn_opcodes_h_l519_c9_c348_iffalse,
MUX_uxn_opcodes_h_l519_c9_c348_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l520_c42_c385
BIN_OP_MINUS_uxn_opcodes_h_l520_c42_c385 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l520_c42_c385_left,
BIN_OP_MINUS_uxn_opcodes_h_l520_c42_c385_right,
BIN_OP_MINUS_uxn_opcodes_h_l520_c42_c385_return_output);

-- device_out_uxn_opcodes_h_l520_c23_9875
device_out_uxn_opcodes_h_l520_c23_9875 : entity work.device_out_0CLK_1666823b port map (
clk,
device_out_uxn_opcodes_h_l520_c23_9875_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l520_c23_9875_device_address,
device_out_uxn_opcodes_h_l520_c23_9875_value,
device_out_uxn_opcodes_h_l520_c23_9875_phase,
device_out_uxn_opcodes_h_l520_c23_9875_previous_device_ram_read,
device_out_uxn_opcodes_h_l520_c23_9875_previous_ram_read,
device_out_uxn_opcodes_h_l520_c23_9875_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l497_c6_6484_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06_return_output,
 n8_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output,
 t8_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output,
 result_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output,
 device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output,
 n8_MUX_uxn_opcodes_h_l510_c7_bf06_return_output,
 t8_MUX_uxn_opcodes_h_l510_c7_bf06_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06_return_output,
 device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740_return_output,
 n8_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output,
 t8_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output,
 device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output,
 sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l519_c9_8f4f_return_output,
 MUX_uxn_opcodes_h_l519_c9_c348_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l520_c42_c385_return_output,
 device_out_uxn_opcodes_h_l520_c23_9875_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_6484_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_6484_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_6484_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c2_8ebe_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c2_8ebe_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l510_c7_bf06_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c2_8ebe_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c2_8ebe_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c2_8ebe_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l510_c7_bf06_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c2_8ebe_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l497_c2_8ebe_iftrue : opcode_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l497_c2_8ebe_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l497_c2_8ebe_iffalse : opcode_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_ae33_uxn_opcodes_h_l497_c2_8ebe_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l497_c2_8ebe_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l502_c3_8d33 : signed(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c3_8c89 : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l510_c7_bf06_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l510_c7_bf06_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l510_c7_bf06_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l511_c3_630a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l510_c7_bf06_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l513_c7_3cb3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l513_c7_3cb3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l518_c3_0a54 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l519_c9_c348_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_8f4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_8f4f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_8f4f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l519_c9_c348_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l519_c9_c348_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l519_c9_c348_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_9875_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_9875_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_9875_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_9875_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_9875_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_c385_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_c385_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_c385_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_9875_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_9875_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l521_c32_a3d9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l522_c31_3785_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l523_c21_ccb9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l524_c22_62e5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l525_c26_5f4c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l526_c29_cc1b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l527_c24_4503_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_eb40_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_01a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_fcf9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_a2d3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_b96d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_66eb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_1c4a_return_output : unsigned(0 downto 0);
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
     VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f_y := resize(to_signed(-2, 3), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l502_c3_8d33 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l518_c3_0a54 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l518_c3_0a54;
     VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_8f4f_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_c385_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c3_8c89 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l511_c3_630a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l511_c3_630a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_6484_right := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l519_c9_c348_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l497_c2_8ebe_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_6484_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_8f4f_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_c385_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l520_c23_9875_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l520_c23_9875_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l519_c9_c348_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l520_c23_9875_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l497_c2_8ebe_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_66eb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_66eb_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_eb40 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_eb40_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l497_c6_6484] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l497_c6_6484_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_6484_left;
     BIN_OP_EQ_uxn_opcodes_h_l497_c6_6484_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_6484_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_6484_return_output := BIN_OP_EQ_uxn_opcodes_h_l497_c6_6484_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l510_c7_bf06] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l510_c7_bf06_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_1c4a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_1c4a_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l515_c30_1e5f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f_ins;
     sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f_x;
     sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f_return_output := sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_01a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_01a2_return_output := result.is_opc_done;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770[uxn_opcodes_h_l497_c2_8ebe] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l497_c2_8ebe_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4770(
     result,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l502_c3_8d33,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c3_8c89,
     to_unsigned(0, 1));

     -- result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l510_c7_bf06] LATENCY=0
     VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l510_c7_bf06_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l510_c11_82dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_b96d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_b96d_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l513_c11_20a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l519_c9_8f4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l519_c9_8f4f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_8f4f_left;
     BIN_OP_EQ_uxn_opcodes_h_l519_c9_8f4f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_8f4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_8f4f_return_output := BIN_OP_EQ_uxn_opcodes_h_l519_c9_8f4f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_fcf9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_fcf9_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_a2d3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_a2d3_return_output := result.vram_write_layer;

     -- BIN_OP_MINUS[uxn_opcodes_h_l520_c42_c385] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l520_c42_c385_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_c385_left;
     BIN_OP_MINUS_uxn_opcodes_h_l520_c42_c385_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_c385_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_c385_return_output := BIN_OP_MINUS_uxn_opcodes_h_l520_c42_c385_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_6484_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_6484_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l497_c2_8ebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_6484_return_output;
     VAR_result_MUX_uxn_opcodes_h_l497_c2_8ebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_6484_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l497_c2_8ebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_6484_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l510_c7_bf06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l510_c7_bf06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_82dc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l513_c7_3cb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l513_c7_3cb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_20a8_return_output;
     VAR_MUX_uxn_opcodes_h_l519_c9_c348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_8f4f_return_output;
     VAR_device_out_uxn_opcodes_h_l520_c23_9875_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_c385_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_eb40_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_eb40_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_66eb_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_66eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_01a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_01a2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_1c4a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_1c4a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_a2d3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_a2d3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_fcf9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_fcf9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_b96d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_b96d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l497_c2_8ebe_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l497_c2_8ebe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue := VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l510_c7_bf06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l510_c7_bf06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_1e5f_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l513_c7_3cb3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output;

     -- MUX[uxn_opcodes_h_l519_c9_c348] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l519_c9_c348_cond <= VAR_MUX_uxn_opcodes_h_l519_c9_c348_cond;
     MUX_uxn_opcodes_h_l519_c9_c348_iftrue <= VAR_MUX_uxn_opcodes_h_l519_c9_c348_iftrue;
     MUX_uxn_opcodes_h_l519_c9_c348_iffalse <= VAR_MUX_uxn_opcodes_h_l519_c9_c348_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l519_c9_c348_return_output := MUX_uxn_opcodes_h_l519_c9_c348_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l510_c7_bf06] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06_return_output;

     -- t8_MUX[uxn_opcodes_h_l513_c7_3cb3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l513_c7_3cb3_cond <= VAR_t8_MUX_uxn_opcodes_h_l513_c7_3cb3_cond;
     t8_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue;
     t8_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output := t8_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l510_c7_bf06] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_bf06_return_output;
     VAR_device_out_uxn_opcodes_h_l520_c23_9875_value := VAR_MUX_uxn_opcodes_h_l519_c9_c348_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse := VAR_MUX_uxn_opcodes_h_l519_c9_c348_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse := VAR_t8_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l510_c7_bf06] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06_return_output;

     -- t8_MUX[uxn_opcodes_h_l510_c7_bf06] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l510_c7_bf06_cond <= VAR_t8_MUX_uxn_opcodes_h_l510_c7_bf06_cond;
     t8_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue;
     t8_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l510_c7_bf06_return_output := t8_MUX_uxn_opcodes_h_l510_c7_bf06_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l513_c7_3cb3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output;

     -- n8_MUX[uxn_opcodes_h_l513_c7_3cb3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l513_c7_3cb3_cond <= VAR_n8_MUX_uxn_opcodes_h_l513_c7_3cb3_cond;
     n8_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue;
     n8_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output := n8_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse := VAR_n8_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l497_c2_8ebe_iffalse := VAR_t8_MUX_uxn_opcodes_h_l510_c7_bf06_return_output;
     -- t8_MUX[uxn_opcodes_h_l497_c2_8ebe] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l497_c2_8ebe_cond <= VAR_t8_MUX_uxn_opcodes_h_l497_c2_8ebe_cond;
     t8_MUX_uxn_opcodes_h_l497_c2_8ebe_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l497_c2_8ebe_iftrue;
     t8_MUX_uxn_opcodes_h_l497_c2_8ebe_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l497_c2_8ebe_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output := t8_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output;

     -- n8_MUX[uxn_opcodes_h_l510_c7_bf06] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l510_c7_bf06_cond <= VAR_n8_MUX_uxn_opcodes_h_l510_c7_bf06_cond;
     n8_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue;
     n8_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l510_c7_bf06_return_output := n8_MUX_uxn_opcodes_h_l510_c7_bf06_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l517_c1_1740] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l520_c23_9875_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_1740_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l497_c2_8ebe_iffalse := VAR_n8_MUX_uxn_opcodes_h_l510_c7_bf06_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output;
     -- n8_MUX[uxn_opcodes_h_l497_c2_8ebe] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l497_c2_8ebe_cond <= VAR_n8_MUX_uxn_opcodes_h_l497_c2_8ebe_cond;
     n8_MUX_uxn_opcodes_h_l497_c2_8ebe_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l497_c2_8ebe_iftrue;
     n8_MUX_uxn_opcodes_h_l497_c2_8ebe_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l497_c2_8ebe_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output := n8_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output;

     -- device_out[uxn_opcodes_h_l520_c23_9875] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l520_c23_9875_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l520_c23_9875_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l520_c23_9875_device_address <= VAR_device_out_uxn_opcodes_h_l520_c23_9875_device_address;
     device_out_uxn_opcodes_h_l520_c23_9875_value <= VAR_device_out_uxn_opcodes_h_l520_c23_9875_value;
     device_out_uxn_opcodes_h_l520_c23_9875_phase <= VAR_device_out_uxn_opcodes_h_l520_c23_9875_phase;
     device_out_uxn_opcodes_h_l520_c23_9875_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l520_c23_9875_previous_device_ram_read;
     device_out_uxn_opcodes_h_l520_c23_9875_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l520_c23_9875_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l520_c23_9875_return_output := device_out_uxn_opcodes_h_l520_c23_9875_return_output;

     -- Submodule level 5
     VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse := VAR_device_out_uxn_opcodes_h_l520_c23_9875_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output;
     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_opcodes_h_l524_c22_62e5] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l524_c22_62e5_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_9875_return_output.u16_addr;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l526_c29_cc1b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l526_c29_cc1b_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_9875_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l523_c21_ccb9] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l523_c21_ccb9_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_9875_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l521_c32_a3d9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l521_c32_a3d9_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_9875_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l527_c24_4503] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l527_c24_4503_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_9875_return_output.is_deo_done;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l522_c31_3785] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l522_c31_3785_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_9875_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l525_c26_5f4c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l525_c26_5f4c_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_9875_return_output.is_vram_write;

     -- device_out_result_MUX[uxn_opcodes_h_l513_c7_3cb3] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3_cond;
     device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output := device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l524_c22_62e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l527_c24_4503_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l521_c32_a3d9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l525_c26_5f4c_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l526_c29_cc1b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l522_c31_3785_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l523_c21_ccb9_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l513_c7_3cb3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output := result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l513_c7_3cb3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l510_c7_bf06] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06_cond;
     device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06_return_output := device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l513_c7_3cb3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l513_c7_3cb3] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l513_c7_3cb3] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l513_c7_3cb3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output := result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l513_c7_3cb3] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_bf06_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_3cb3_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l510_c7_bf06] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l510_c7_bf06] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06_cond;
     result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06_return_output := result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l510_c7_bf06] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l510_c7_bf06] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l497_c2_8ebe] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe_cond;
     device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output := device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l510_c7_bf06] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l510_c7_bf06] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06_cond;
     result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06_return_output := result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l510_c7_bf06] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06_return_output;

     -- Submodule level 8
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output;
     -- result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_ae33[uxn_opcodes_h_l497_c2_8ebe] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_ae33_uxn_opcodes_h_l497_c2_8ebe_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ae33(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_bf06_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_bf06_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_bf06_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_bf06_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_bf06_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_bf06_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_bf06_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_bf06_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_bf06_return_output);

     -- Submodule level 9
     VAR_result_MUX_uxn_opcodes_h_l497_c2_8ebe_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_ae33_uxn_opcodes_h_l497_c2_8ebe_return_output;
     -- result_MUX[uxn_opcodes_h_l497_c2_8ebe] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l497_c2_8ebe_cond <= VAR_result_MUX_uxn_opcodes_h_l497_c2_8ebe_cond;
     result_MUX_uxn_opcodes_h_l497_c2_8ebe_iftrue <= VAR_result_MUX_uxn_opcodes_h_l497_c2_8ebe_iftrue;
     result_MUX_uxn_opcodes_h_l497_c2_8ebe_iffalse <= VAR_result_MUX_uxn_opcodes_h_l497_c2_8ebe_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output := result_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output;

     -- Submodule level 10
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l497_c2_8ebe_return_output;
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
